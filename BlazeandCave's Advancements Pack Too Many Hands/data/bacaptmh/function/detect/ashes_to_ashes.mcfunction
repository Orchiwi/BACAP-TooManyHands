# Ashes to Ashes. Executed as/at every survival player on a medium tick while at least one of
# them still lacks the advancement. The 'at @s' in the dispatch line matters: 'if dimension'
# tests the EXECUTION dimension, so without it every check would be answered by the dimension
# the tick function happens to run in.
scoreboard players set @s bacaptmh_vy 999
execute if dimension minecraft:the_end store result score @s bacaptmh_vy run data get entity @s Pos[1]

# Below Y=-32 in the End there is nothing left to stand on: this player is already falling to
# the void death. Stamp a 20-window - 20 medium ticks, 200 game ticks, ten seconds.
execute if score @s bacaptmh_vy matches ..-32 run scoreboard players set @s bacaptmh_void 20

# Two open windows at once is the advancement. The count is a real head count, not
# 'if entity @a[limit=2]', which only ever asks whether at least one player matches.
scoreboard players set #void bacaptmh_m9 0
execute if score @s bacaptmh_void matches 1.. as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_void=1..}] run scoreboard players add #void bacaptmh_m9 1
execute if score #void bacaptmh_m9 matches 2.. run advancement grant @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_void=1..}] only bacaptmh:end/ashes_to_ashes
