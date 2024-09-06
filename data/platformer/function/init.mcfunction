#> platformer:init
#
# Sets up all objectives and other setup.
#
# @handles minecraft:load

scoreboard objectives add platformer.jump dummy
scoreboard objectives add platformer.horizontal_increment dummy
scoreboard objectives add platformer.horizontal_speed dummy
scoreboard objectives add platformer.tmp dummy
scoreboard objectives add platformer.player_id dummy
scoreboard players add $next_id platformer.player_id 0

scoreboard objectives add platformer.const dummy
scoreboard players set 2 platformer.const 2