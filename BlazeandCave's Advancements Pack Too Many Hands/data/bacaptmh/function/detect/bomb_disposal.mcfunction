# Bomb Disposal - executed as and at a LIVE Creeper within twelve blocks of a player who
# still lacks this. Its only job is to record who the Creeper is actually hunting, while it
# is still alive to have a target at all: a mob's target is gone by the time anything can
# react to its death, and raw proximity credits the killer himself, who is necessarily point
# blank when he melees it.
execute store result score #bd_hp bacaptmh_tmp run data get entity @s Health 10
execute unless score #bd_hp bacaptmh_tmp matches 1.. run return 0
# 'execute on target' changes the executor only - the position stays on the Creeper - so
# distance=..3.5 here is measured from the Creeper, which is the range at which it hisses.
execute on target if entity @s[type=player,gamemode=!spectator,distance=..3.5] run scoreboard players set @s bacaptmh_bdv 6
