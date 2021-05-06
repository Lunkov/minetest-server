#!/bin/sh

rm -r ./mods
mkdir -p ./mods

cd ./mods/

git clone https://github.com/minetest-mods/areas.git
git clone https://github.com/minetest-mods/warps.git
git clone https://github.com/minetest-mods/teleport-request.git
git clone https://github.com/minetest-mods/nether.git
git clone https://github.com/minetest-mods/ropes.git
git clone https://github.com/minetest-mods/named_waypoints.git

git clone https://github.com/minetest-mods/lightning.git
git clone https://github.com/minetest-mods/moreores.git
git clone https://github.com/minetest-mods/dynamic_liquid.git
git clone https://github.com/minetest-mods/magma_conduits.git
git clone https://github.com/minetest-mods/radiant_damage.git

git clone https://github.com/minetest-mods/unified_inventory.git
git clone https://github.com/minetest-mods/workbench.git
git clone https://github.com/minetest-mods/stamina.git
git clone https://github.com/minetest-mods/playeranim.git
git clone https://github.com/minetest-mods/anvil.git
git clone https://github.com/minetest-mods/gauges.git
git clone https://github.com/minetest-mods/letters.git

git clone https://github.com/minetest-mods/subterrane.git

git clone https://github.com/minetest-mods/moreblocks.git
git clone https://github.com/minetest-mods/quartz.git
git clone https://github.com/minetest-mods/mesecons.git
git clone https://github.com/minetest-mods/technic.git

git clone https://github.com/minetest-mods/3d_armor.git

git clone https://github.com/minetest-mods/castle_gates.git
git clone https://github.com/minetest-mods/castle_tapestries.git
git clone https://github.com/minetest-mods/castle_weapons.git
git clone https://github.com/minetest-mods/castle_storage.git
git clone https://github.com/minetest-mods/castle_masonry.git
git clone https://github.com/minetest-mods/castle_lighting.git
git clone https://github.com/minetest-mods/castle_farming.git
git clone https://github.com/minetest-mods/castle_shields.git

git clone https://github.com/minetest-mods/ts_furniture.git
git clone https://github.com/minetest-mods/ts_doors.git

git clone https://github.com/minetest-mods/compost.git

git clone https://github.com/minetest-mods/lavastuff.git

git clone https://github.com/minetest-mods/commoditymarket_fantasy.git

git clone https://github.com/minetest-mods/cloud_items.git
git clone https://github.com/minetest-mods/more_chests.git
git clone https://github.com/minetest-mods/torch_bomb.git

git clone https://github.com/minetest-mods/airtanks.git

git clone https://github.com/minetest-mods/digtron.git
git clone https://github.com/minetest-mods/vehicle_mash.git
git clone https://github.com/paramat/airboat.git

git clone https://github.com/AiTechEye/aliveai.git

( find . -type d -name ".git" && find . -name ".gitignore" && find . -name ".github" && find . -name ".gitmodules" ) | xargs -d '\n' rm -rf

cd ..
