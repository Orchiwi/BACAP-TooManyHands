# A4 Campfire Stories. Run at a player who was crouched in the last 1.5 s, only at night
# and only with four or more non-spectators online.
# A lit campfire has to be within reach: the 3x3 column at foot level and the 3x3 column
# one block below, which covers standing beside the fire and standing on a block level
# with it. Eighteen block tests is cheaper and far more predictable than a scan loop.
scoreboard players set #cf bacaptmh_m8 0
execute if block ~ ~ ~ #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~1 ~ ~ #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~-1 ~ ~ #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~ ~ ~1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~ ~ ~-1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~1 ~ ~1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~1 ~ ~-1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~-1 ~ ~1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~-1 ~ ~-1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~ ~-1 ~ #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~1 ~-1 ~ #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~-1 ~-1 ~ #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~ ~-1 ~1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~ ~-1 ~-1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~1 ~-1 ~1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~1 ~-1 ~-1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~-1 ~-1 ~1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if block ~-1 ~-1 ~-1 #minecraft:campfires[lit=true] run scoreboard players set #cf bacaptmh_m8 1
execute if score #cf bacaptmh_m8 matches 0 run return 0

# A real head count of crouched players around this one, then grant to all of them.
execute store result score #cfn bacaptmh_m8 if entity @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_cs=1..},distance=..5]
execute if score #cfn bacaptmh_m8 matches 4.. run advancement grant @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_cs=1..},distance=..5] only bacaptmh:building/campfire_stories
