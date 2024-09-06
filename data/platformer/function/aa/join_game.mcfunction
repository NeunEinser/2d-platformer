#> platformer:aa/join_game
#
# Run to join the game
#
# @api
# @player
# @context entity The player to become the player

execute unless score @s platformer.player_id matches -2147483648.. \
	run scoreboard players operation @s platformer.player_id = $next_id platformer.player_id
execute if score @s platformer.player_id = $next_id platformer.player_id \
	run scoreboard players add $next_id platformer.player_id 1

scoreboard players operation $current_id platformer.player_id = @s platformer.player_id

execute at @e[type=minecraft:marker, tag=platformer.spawn] \
	summon minecraft:armor_stand \
	run function platformer:setup_character

loot replace entity \
	@e[type=minecraft:armor_stand,tag=platformer.character,tag=platformer.current] \
	armor.head \
	loot platformer:player_head

execute at @e[type=minecraft:marker, tag=platformer.spawn] \
	summon minecraft:armor_stand \
	run function platformer:setup_camera

scoreboard players set @s platformer.horizontal_increment 128
scoreboard players set @s platformer.horizontal_speed 0
scoreboard players set @s platformer.jump 0

gamemode spectator @s
tag @s add platformer.player