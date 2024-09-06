#> platformer:tick/tick
#
# Runs once per tick
#
# @handles minecraft:tick

execute as @a[tag=platformer.player,limit=1] run function platformer:tick/player_tick
