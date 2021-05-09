FROM alpine:3.13

ENV MINETEST_GAME_VERSION master
ENV IRRLICHT_VERSION master

RUN apk add --no-cache git build-base cmake sqlite-dev curl-dev zlib-dev gd-dev python3 \
		gmp-dev jsoncpp-dev postgresql-dev luajit-dev ca-certificates findutils

WORKDIR /usr/src/minetest
RUN git clone https://github.com/minetest/minetest.git /usr/src/minetest

RUN git clone --depth=1 -b ${MINETEST_GAME_VERSION} https://github.com/minetest/minetest_game.git ./games/minetest_game && \
	rm -fr ./games/minetest_game/.git

WORKDIR /usr/src/

RUN git clone --recursive https://github.com/jupp0r/prometheus-cpp/ && \
	mkdir prometheus-cpp/build && \
	cd prometheus-cpp/build && \
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr/local \
		-DCMAKE_BUILD_TYPE=Release \
		-DENABLE_TESTING=0 && \
	make -j2 && \
	make install

RUN git clone --depth=1 https://github.com/minetest/irrlicht/ -b ${IRRLICHT_VERSION} && \
	cp -r irrlicht/include /usr/include/irrlichtmt

# BUILD MINETEST
WORKDIR /usr/src/minetest
RUN mkdir -p build && \
	cd build && \
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr/local \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SERVER=TRUE \
		-DENABLE_PROMETHEUS=TRUE \
		-DBUILD_UNITTESTS=FALSE \
		-DBUILD_CLIENT=FALSE && \
	make -j2 && \
	make install

# APPEND MAPPER
WORKDIR /usr/src/minetestmapper
RUN git clone https://github.com/minetest/minetestmapper.git /usr/src/minetestmapper && \
	cmake . -DENABLE_LEVELDB=1 && \
	make -j2 && \
	make install

# APPEND MODS
WORKDIR /usr/src/
ADD update_mods.sh /usr/src/update_mods.sh
RUN ls -l 
RUN /usr/src/update_mods.sh

FROM alpine:3.13

RUN apk add --no-cache dcron sqlite-libs curl gmp libstdc++ libgcc libpq luajit jsoncpp && \
	adduser -D minetest --uid 30000 -h /var/lib/minetest && \
	chown -R minetest:minetest /var/lib/minetest && \
	rm -rf /var/cache/apk/*

WORKDIR /var/lib/minetest

COPY --from=0 /usr/local/share/minetest /usr/local/share/minetest
COPY --from=0 /usr/local/bin/minetestserver /usr/local/bin/minetestserver
COPY --from=0 /usr/local/bin/minetestmapper /usr/local/bin/minetestmapper
COPY --from=0 /usr/local/share/doc/minetest/minetest.conf.example /etc/minetest/minetest.conf
COPY --from=0 /usr/src/mods /usr/local/share/minetest/games/minetest_game/mods

RUN ls -l /etc/minetest/
RUN ls -l /usr/local/share/minetest/games/minetest_game/mods
RUN ls -l /usr/local/bin/
#RUN cat /etc/minetest/minetest.conf

ADD entrypoint.sh /entrypoint.sh

# Give execution rights on the cron job
RUN mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d

# Add crontab file in the cron directory
ADD crontab /etc/crontab

USER minetest:minetest
EXPOSE 30000/udp 30000/tcp

# CMD ["/usr/local/bin/minetestserver", "--config", "/etc/minetest/minetest.conf"]
ENTRYPOINT ["/entrypoint.sh"]
