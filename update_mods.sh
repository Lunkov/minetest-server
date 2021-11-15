#!/bin/bash

FOLDER_TMP=./mods.tmp
FOLDER_DST=./mods

get() {
  printf "GET $2\n"
  git clone $1 $FOLDER_TMP/$2 &> /dev/null
  ( find $FOLDER_TMP/$2 -type d -name ".git" && find . -name ".gitignore" && find . -name ".github" && find . -name ".gitmodules" ) | xargs -d '\n' rm -rf
}

getOne() {
  printf "GET $2\n"
  git clone $1 $FOLDER_TMP/$2 &> /dev/null
  ( find $FOLDER_TMP/$2 -type d -name ".git" && find . -name ".gitignore" && find . -name ".github" && find . -name ".gitmodules" ) | xargs -d '\n' rm -rf
  transferOne $1 $2
}

getMany() {
  printf "GET $2\n"
  git clone $1 $FOLDER_TMP/$2 &> /dev/null
  ( find $FOLDER_TMP/$2 -type d -name ".git" && find . -name ".gitignore" && find . -name ".github" && find . -name ".gitmodules" ) | xargs -d '\n' rm -rf
  transferMany $2 "$3"
}

transferMany() {
  SRC=$1
  myarray=($2)
  for fld in "${myarray[@]}" ; do
    DST=${fld/$SRC/}
    printf "MOVE $FOLDER_TMP/${fld} -> $FOLDER_DST${DST}\n"
    mv -fu $FOLDER_TMP/${fld} $FOLDER_DST${DST}
  done
}

transferOne() {
  SRC=$1
  myarray=($2)
  for fld in "${myarray[@]}" ; do
    printf "move $FOLDER_TMP/${fld} -> $FOLDER_DST/${fld}\n"
    mv -fu $FOLDER_TMP/${fld} $FOLDER_DST/${fld}
  done
}

printf "UPDATE MINETEST MODS\n"
printf "TMP FOLDER: ${FOLDER_TMP}\n"
printf "DESTINATION FOLDER: ${FOLDER_DST}\n"
printf "...\n"

rm -r $FOLDER_TMP
mkdir -p $FOLDER_TMP

rm -r $FOLDER_DST
mkdir -p $FOLDER_DST

getMany https://github.com/minetest-mods/mesecons.git mesecons "mesecons/mesecons_commandblock mesecons/mesecons_fpga mesecons/mesecons_lightstone mesecons/mesecons_mvps mesecons/mesecons_random mesecons/mesecons_torch mesecons/mesecons mesecons/mesecons_delayer mesecons/mesecons_gates mesecons/mesecons_luacontroller mesecons/mesecons_noteblock mesecons/mesecons_receiver mesecons/mesecons_walllever mesecons/mesecons_alias mesecons/mesecons_detector mesecons/mesecons_hydroturbine mesecons/mesecons_materials mesecons/mesecons_pistons mesecons/mesecons_solarpanel mesecons/mesecons_wires mesecons/mesecons_blinkyplant mesecons/mesecons_doors mesecons/mesecons_insulated mesecons/mesecons_microcontroller mesecons/mesecons_powerplant mesecons/mesecons_stickyblocks mesecons/mesecons_button mesecons/mesecons_extrawires mesecons/mesecons_lamp mesecons/mesecons_movestones mesecons/mesecons_pressureplates mesecons/mesecons_switch"
getMany https://github.com/minetest-mods/technic.git technic "technic/concrete technic/extranodes technic/technic technic/technic_chests technic/technic_cnc technic/technic_worldgen technic/wrench"
getMany https://github.com/APercy/some_more_trains.git some_more_trains "some_more_trains/somemoretrains_tram"
getMany https://github.com/Marnack/dlxtrains_modpack.git dlxtrains_modpack "dlxtrains_modpack/dlxtrains dlxtrains_modpack/dlxtrains_cargo dlxtrains_modpack/dlxtrains_industrial_wagons dlxtrains_modpack/dlxtrains_support_wagons"
getMany https://github.com/minetest-mods/3d_armor.git 3d_armor "3d_armor/3d_armor 3d_armor/3d_armor_sfinv 3d_armor/3d_armor_ui 3d_armor/3d_armor_ip 3d_armor/3d_armor_stand 3d_armor/shields 3d_armor/wieldview"
getMany https://github.com/orwell96/advtrains.git advtrains "advtrains/advtrains advtrains/advtrains_luaautomation advtrains/advtrains_train_japan advtrains/advtrains_train_subway advtrains/assets advtrains/advtrains_itrainmap advtrains/advtrains_train_industrial advtrains/advtrains_train_steam advtrains/advtrains_train_track"

getOne https://github.com/Sokomine/MT_Village_Set.git MT_Village_Set
getOne https://github.com/ElCeejo/adv_lightsabers.git adv_lightsabers
getOne https://github.com/berengma/aerotest.git aerotest
getOne https://github.com/paramat/airboat.git airboat
getOne https://github.com/minetest-mods/airtanks.git airtanks
getOne https://github.com/APercy/airutils.git airutils
getOne https://github.com/minetest-mods/anvil.git anvil
getOne https://github.com/Sokomine/basic_houses.git basic_houses
getOne https://bitbucket.org/kingarthursteam/cannons.git cannons
getOne https://github.com/minetest-mods/castle_farming.git castle_farming
getOne https://github.com/minetest-mods/castle_gates.git castle_gates
getOne https://github.com/minetest-mods/castle_lighting.git castle_lighting
getOne https://github.com/minetest-mods/castle_masonry.git castle_masonry
getOne https://github.com/minetest-mods/castle_shields.git castle_shields
getOne https://github.com/minetest-mods/castle_storage.git castle_storage
getOne https://github.com/minetest-mods/castle_tapestries.git castle_tapestries
getOne https://github.com/minetest-mods/castle_weapons.git castle_weapons
getOne https://github.com/minetest-mods/cloud_items.git cloud_items
getOne https://github.com/minetest-mods/commoditymarket_fantasy.git commoditymarket_fantasy
getOne https://github.com/minetest-mods/compost.git compost
getOne https://github.com/Sokomine/cottages.git cottages
getOne https://github.com/APercy/demoiselle.git demoiselle
getOne https://github.com/minetest-mods/digtron.git digtron
getOne https://github.com/ElCeejo/draconis.git draconis
getOne https://github.com/Sokomine/gates_long.git gates_long
getOne https://github.com/minetest-mods/gauges.git gauges
getOne https://github.com/ElCeejo/grave.git grave
getOne https://github.com/Sokomine/handle_schematics.git handle_schematics
getOne https://github.com/APercy/helicopter.git nss_helicopter
getOne https://github.com/APercy/hidroplane.git hidroplane
getOne https://gitlab.com/benrob0329/ikea.git ikea
getOne https://github.com/minetest-mods/lavastuff.git lavastuff
getOne https://github.com/minetest-mods/letters.git letters
getOne https://github.com/minetest-mods/mg.git mg
getOne https://github.com/Sokomine/mg_villages.git mg_villages
getOne https://github.com/APercy/minekart.git minekart
getOne https://github.com/APercy/minetest_biofuel.git biofuel
getOne https://github.com/ElCeejo/mob_core.git mob_core
getOne https://github.com/TheTermos/mobkit.git mobkit
getOne https://github.com/AntumMT/mod-cmer.git cmer
getOne https://github.com/AntumMT/mod-cmer_shark.git cmer_shark
getOne https://github.com/AntumMT/mod-hovercraft.git hovercraft
getOne https://github.com/AntumMT/mod-skeleton.git skeleton
getOne https://github.com/minetest-mods/more_chests.git more_chests
getOne https://github.com/APercy/motorboat.git motorboat
getOne https://github.com/APercy/nautilus.git nautilus
getOne https://github.com/ElCeejo/paleotest.git paleotest
getOne https://github.com/minetest-mods/playeranim.git playeranim
getOne https://github.com/APercy/portals.git portals
getOne https://github.com/TheTermos/sailing_kit.git sailing_kit
getOne https://github.com/Sokomine/ships_on_mapgen.git ships_on_mapgen
getOne https://github.com/minetest-mods/stamina.git stamina
getOne https://github.com/minetest-mods/subterrane.git subterrane
getOne https://github.com/minetest-mods/torch_bomb.git torch_bomb
getOne https://github.com/Sokomine/travelnet.git travelnet
getOne https://github.com/APercy/trike.git trike
getOne https://github.com/minetest-mods/ts_doors.git ts_doors
getOne https://github.com/minetest-mods/ts_furniture.git ts_furniture
getOne https://github.com/minetest-mods/unified_inventory.git unified_inventory
getOne https://github.com/minetest-mods/vehicle_mash.git vehicle_mash
getOne https://github.com/berengma/water_life.git water_life
getOne https://github.com/TheTermos/wildlife.git wildlife
getOne https://github.com/minetest-mods/workbench.git workbench
getOne https://github.com/minetest-mods/mymonths.git mymonths
getOne https://github.com/minetest-mods/areas.git areas
getOne https://github.com/berengma/aviator.git aviator
getOne https://github.com/berengma/basic_machines.git basic_machines
getOne https://github.com/Ezhh/caverealms_lite.git caverealms_lite
getOne https://github.com/minetest-game-mods/dungeon_loot.git dungeon_loot
getOne https://github.com/minetest-mods/dynamic_liquid.git dynamic_liquid
getOne https://github.com/minetest-game-mods/flowers.git flowers
getOne https://github.com/minetest-mods/lightning.git lightning
getOne https://github.com/minetest-mods/magma_conduits.git magma_conduits
getOne https://github.com/minetest-mods/moreblocks.git moreblocks
getOne https://github.com/minetest-mods/moreores.git moreores
getOne https://github.com/minetest-mods/named_waypoints.git named_waypoints
getOne https://github.com/minetest-mods/nether.git nether
getOne https://gitlab.com/VanessaE/pipeworks.git pipeworks
getOne https://github.com/berengma/pocketnuke.git pocketnuke
getOne https://github.com/minetest-mods/quartz.git quartz
getOne https://github.com/minetest-mods/radiant_damage.git radiant_damage
getOne https://github.com/minetest-mods/ropes.git ropes
getOne https://github.com/minetest-game-mods/sethome.git sethome
getOne https://github.com/minetest-game-mods/stairs.git stairs
getOne https://github.com/minetest-mods/teleport-request.git teleport-request
getOne https://github.com/minetest-game-mods/vessels.git vessels
getOne https://github.com/minetest-game-mods/walls.git walls
getOne https://github.com/minetest-mods/warps.git warps
getOne https://github.com/minetest-game-mods/wool.git wool
getOne https://github.com/minetest-mods/skinsdb.git skinsdb
getOne https://github.com/minetest-mods/schemlib.git schemlib
getOne https://github.com/minetest-mods/xdecor.git xdecor
getOne https://github.com/minetest-mods/painting.git painting
getOne https://github.com/minetest-mods/skybox.git skybox
getOne https://github.com/Skandarella/animalworld.git animalworld
getOne https://github.com/AndrejIT/asphalt.git asphalt
getOne https://github.com/minetest-game-mods/beds.git beds
getOne https://github.com/minetest-game-mods/binoculars.git binoculars
getOne https://github.com/minetest-mods/computer.git computer
getOne https://github.com/minetest-game-mods/bones.git bones
getOne https://github.com/minetest-mods/craftguide.git craftguide
getOne https://github.com/minetest-mods/turtle.git turtle
getOne https://github.com/minetest-game-mods/xpanes.git xpanes
getOne https://github.com/minetest-mods/zombies.git zombies
getOne https://github.com/hkzorman/advanced_npc.git advanced_npc
getOne https://github.com/minetest-game-mods/butterflies.git butterflies
getOne https://github.com/minetest-mods/bulletin_boards.git bulletin_boards


#get https://gitlab.com/daretmavi/a-planet-alive.git a-planet-alive

rm -r $FOLDER_TMP
