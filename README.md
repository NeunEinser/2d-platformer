## 2D Platformer

A simple datapack for a 2D platformer in Minecraft.

Works multiplayer

## Disclaimer

Unfortunately the controls feel a bit janky and there is some noticable input delay with this
implementation. My guess is it's because I use motion to move the armor stand rather than tp.  
Using motion allows to not have to worry about implementing collision logic. A proper implementation
should work differently. This is more of a quick hack / test to play around with the new player
input predicates

## Setup

`/function platformer:aa/set_spawn` - Sets the player spawn. This location should always be loaded.
`/function platformer:aa/join_game` - Joins the game. Multiplayer is supported.

To leave press F3+F4 to switch gamemode.
You can also use `/function platformer:aa/leave_game`, but it will put you in adventure mode by
default and is more intended for actual usage in a map.

## Controls

jump, left right, as they are bound in game.
hold jump longer for a bigger jump