#> platformer:setup_character
#
# Sets up a newly created character
#
# @context entity The newly created armor stand

tag @e[type=minecraft:armor_stand,tag=platformer.current] remove platformer.current
tag @s add platformer.character
tag @s add platformer.current
data modify entity @s Invulnerable set value true
scoreboard players operation @s platformer.player_id = $current_id platformer.player_id