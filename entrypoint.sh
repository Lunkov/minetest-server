#!/bin/bash

/usr/local/bin/minetestserver --config /etc/minetest/minetest.conf &

cron -L 5 && tail -f /var/log/cron.log

