#> platformer:aa/become_player
#
# Run to no longer be the player
#
# @api
# @player
# @context entity The player to no longer be the player

scoreboard players operation $current_id platformer.player_id = @s platformer.player_id

execute if entity @s[gamemode=spectator] run gamemode adventure @s
execute as @e[type=minecraft:armor_stand, tag=platformer.character] \
	if score @s platformer.player_id = $current_id platformer.player_id \
	run kill @s
execute as @e[type=minecraft:armor_stand, tag=platformer.camera] \
	if score @s platformer.player_id = $current_id platformer.player_id \
	run kill @s
tag @s remove platformer.player