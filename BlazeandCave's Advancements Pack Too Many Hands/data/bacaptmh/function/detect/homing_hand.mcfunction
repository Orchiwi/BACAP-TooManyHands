# Executed as and at a player who has just been handed a Compass by somebody else. Records
# where the hand-over happened and opens a five-minute window (600 medium ticks). The item
# predicate cannot ask whether the Compass is bound - minecraft:lodestone_tracker is not an
# item sub-predicate - so the link is made in time and in distance instead.
scoreboard players set @s bacaptmh_hpw 600
execute store result score @s bacaptmh_hpx run data get entity @s Pos[0]
execute store result score @s bacaptmh_hpz run data get entity @s Pos[2]
