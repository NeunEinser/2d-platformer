#> platformer:aa/set_spawn
#
# Sets the spawn to the current location
#
# @api
# @player
# @context postition the location

kill @e[type=minecraft:marker,tag=platformer.spawn]
execute align xyz run summon marker ~.5 ~ ~.5 {Tags: ["platformer.spawn"]}