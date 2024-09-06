#> platformer:tick/player_tick
#
# Runs once per tick with the player as execution context. There should always only be one player.
#
# @context entity player

scoreboard players operation $current_id platformer.player_id = @s platformer.player_id

execute if entity @s[gamemode=!spectator] run function platformer:aa/leave_game
execute if entity @s[gamemode=!spectator] run return 0

tag @e[type=minecraft:armor_stand,tag=platformer.camera] remove platformer.current
execute as @e[type=minecraft:armor_stand,tag=platformer.camera] \
	if score @s platformer.player_id = $current_id platformer.player_id \
	run tag @s add platformer.current

spectate @e[type=minecraft:armor_stand,tag=platformer.camera,tag=platformer.current,limit=1]

execute if predicate platformer:jump run function platformer:controls/jump
execute unless predicate platformer:jump run scoreboard players set @s platformer.jump 0

# move left and increase motion when pressing left longer
scoreboard players operation $jump platformer.tmp = @s platformer.jump
execute if predicate platformer:left \
	if score @s platformer.horizontal_speed matches ..0 \
	run scoreboard players operation @s platformer.horizontal_speed -= @s platformer.horizontal_increment
execute if predicate platformer:left \
	if score @s platformer.horizontal_speed matches ..0 \
	run scoreboard players operation @s platformer.horizontal_increment /= 2 platformer.const

# stop left movement when letting go of left input
execute unless predicate platformer:left \
	if score @s platformer.horizontal_speed matches ..-1 \
	run scoreboard players operation @s platformer.horizontal_increment *= 2 platformer.const
execute unless predicate platformer:left \
	if score @s platformer.horizontal_speed matches ..-1 \
	if score @s platformer.horizontal_increment matches 0 \
	run scoreboard players set @s platformer.horizontal_increment 1
execute unless predicate platformer:left \
	if score @s platformer.horizontal_speed matches ..-1 \
	run scoreboard players operation @s platformer.horizontal_speed += @s platformer.horizontal_increment

# stop left movement faster when pressing right
execute if predicate platformer:right \
	if score @s platformer.horizontal_speed matches ..-1 \
	run scoreboard players operation @s platformer.horizontal_increment *= 2 platformer.const
execute if predicate platformer:right \
	if score @s platformer.horizontal_speed matches ..-1 \
	run scoreboard players operation @s platformer.horizontal_speed += @s platformer.horizontal_increment


# move right and increase motion when pressing right longer
scoreboard players operation $jump platformer.tmp = @s platformer.jump
execute if predicate platformer:right \
	if score @s platformer.horizontal_speed matches 0.. \
	run scoreboard players operation @s platformer.horizontal_speed += @s platformer.horizontal_increment
execute if predicate platformer:right \
	if score @s platformer.horizontal_speed matches 0.. \
	run scoreboard players operation @s platformer.horizontal_increment /= 2 platformer.const

# stop right movement when letting go of right input
execute unless predicate platformer:right \
	if score @s platformer.horizontal_speed matches 1.. \
	run scoreboard players operation @s platformer.horizontal_increment *= 2 platformer.const
execute unless predicate platformer:right \
	if score @s platformer.horizontal_speed matches 1.. \
	if score @s platformer.horizontal_increment matches 0 \
	run scoreboard players set @s platformer.horizontal_increment 1
execute unless predicate platformer:right \
	if score @s platformer.horizontal_speed matches 1.. \
	run scoreboard players operation @s platformer.horizontal_speed -= @s platformer.horizontal_increment

# stop right movement faster when pressing left
execute if predicate platformer:left \
	if score @s platformer.horizontal_speed matches 1.. \
	run scoreboard players operation @s platformer.horizontal_increment *= 2 platformer.const
execute if predicate platformer:left \
	if score @s platformer.horizontal_speed matches 1.. \
	run scoreboard players operation @s platformer.horizontal_speed -= @s platformer.horizontal_increment

scoreboard players operation $horizontal platformer.tmp = @s platformer.horizontal_speed

execute as @e[type=minecraft:armor_stand,tag=platformer.character] \
	if score @s platformer.player_id = $current_id platformer.player_id \
	at @s \
	run function platformer:tick/character_tick

execute if score $current_horizontal platformer.tmp matches 0 \
	run scoreboard players set @s platformer.horizontal_increment 128
execute if score $current_horizontal platformer.tmp matches 0 \
	run scoreboard players set @s platformer.horizontal_speed 0