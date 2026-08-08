# Signal Boost - thirty Repeaters each from two players standing together inside a minute.
# Medium bucket, for EVERY non-spectator non-creative player and never gated on who already
# holds it, so somebody who has it can still be the second pair of hands.
# #d is a SHARED fake player and both operations below silently do not run while
# either side is unset, so a player who has never placed a Repeater used to inherit
# the delta computed for whoever was iterated before them in the same sweep. Zero it
# first and gate on both scores being set: `matches 0..` is false on an unset score.
scoreboard players set #d bacaptmh_repn 0
execute if score @s bacaptmh_rep matches 0.. if score @s bacaptmh_repm matches 0.. run scoreboard players operation #d bacaptmh_repn = @s bacaptmh_rep
execute if score @s bacaptmh_rep matches 0.. if score @s bacaptmh_repm matches 0.. run scoreboard players operation #d bacaptmh_repn -= @s bacaptmh_repm
execute if score @s bacaptmh_rep matches 0.. run scoreboard players operation @s bacaptmh_repm = @s bacaptmh_rep
execute store result score #now bacaptmh_rept run time query gametime
scoreboard players operation #age bacaptmh_rept = #now bacaptmh_rept
scoreboard players operation #age bacaptmh_rept -= @s bacaptmh_rept
execute if score #age bacaptmh_rept matches 1200.. run scoreboard players set @s bacaptmh_repn 0
# The window is fixed, not rolling: only the first placement of a run stamps it. `unless
# matches 1..` and not `if matches ..0`, because `matches` is false on an unset score.
execute if score #d bacaptmh_repn matches 1.. unless score @s bacaptmh_repn matches 1.. run scoreboard players operation @s bacaptmh_rept = #now bacaptmh_rept
execute if score #d bacaptmh_repn matches 1..64 run scoreboard players operation @s bacaptmh_repn += #d bacaptmh_repn
tag @s add bacaptmh_sb_self
execute if score @s bacaptmh_repn matches 30.. if entity @a[tag=!bacaptmh_sb_self,gamemode=!spectator,distance=..32,scores={bacaptmh_repn=30..}] run advancement grant @s only bacaptmh:redstone/signal_boost
execute if score @s bacaptmh_repn matches 30.. run advancement grant @a[tag=!bacaptmh_sb_self,gamemode=!spectator,distance=..32,scores={bacaptmh_repn=30..}] only bacaptmh:redstone/signal_boost
tag @s remove bacaptmh_sb_self
