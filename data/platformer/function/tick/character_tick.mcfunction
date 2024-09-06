#> platformer:tick/character_tick
#
# Runs once per tick per player with the corresponding character armor stand as execution context
#
# @context entity The player's corresponding character

execute if score $jump platformer.tmp matches 1.. \
	run data modify entity @s Motion[1] set value 0.4

execute store result score $current_horizontal platformer.tmp run data get entity @s Motion[0] 1024

execute store result entity @s Motion[0] double .00146484375 \
	run scoreboard players get $horizontal platformer.tmp

execute at @s \
	if block ~ ~.9 ~ #platformer:danger_inside \
	run scoreboard players set $current_horizontal platformer.tmp 0
execute at @s \
	if block ~ ~.9 ~ #platformer:danger_inside \
	run data modify entity @s Fire set value 0
execute at @s \
	if block ~ ~.9 ~ #platformer:danger_inside \
	run teleport @s @e[type=minecraft:marker,tag=platformer.spawn,limit=1]
execute if predicate platformer:on_ground \
	at @s \
	if block ~ ~-1 ~ #platformer:danger_top \
	run scoreboard players set $current_horizontal platformer.tmp 0
execute if predicate platformer:on_ground \
	at @s \
	if block ~ ~-1 ~ #platformer:danger_top \
	run teleport @s @e[type=minecraft:marker,tag=platformer.spawn,limit=1]

# Move Camera
# Workaround MC-276315
teleport @e[type=minecraft:armor_stand,tag=platformer.camera,tag=platformer.current,limit=1] @s
teleport @e[type=minecraft:armor_stand,tag=platformer.camera,tag=platformer.current,limit=1] ~ ~2 ~3 180 0

data modify entity \
		@e[type=minecraft:armor_stand,tag=platformer.camera,tag=platformer.current,limit=1] \
		Motion \
		set from entity \
		@s \
		Motion