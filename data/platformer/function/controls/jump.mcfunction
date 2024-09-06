#> platformer:controls/jump
#
# Runs when the player is pressing the jump key
#
# @context entity player


scoreboard players remove @s platformer.jump 1

execute store success score $controls/jump.on_ground platformer.tmp \
	as @e[type=minecraft:armor_stand,tag=platformer.character] \
	if score @s platformer.player_id = $current_id platformer.player_id \
	if predicate platformer:on_ground

execute if score $controls/jump.on_ground platformer.tmp matches 1 \
	run scoreboard players set @s platformer.jump 10