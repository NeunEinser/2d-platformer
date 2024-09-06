#> platformer:setup_camera
#
# Sets up a newly created camera
#
# @context entity The newly created armor stand

data merge entity @s {Marker: true, Invulnerable: true, Invisible: true}
tag @s add platformer.camera
scoreboard players operation @s platformer.player_id = $current_id platformer.player_id