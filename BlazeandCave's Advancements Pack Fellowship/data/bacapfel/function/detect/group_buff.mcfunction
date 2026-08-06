# One NBT scan per effect and nothing else. The old version ran 112 nbt= selector
# evaluations per slow tick, each of which serialises a whole player.
scoreboard players set @a bacapfel_gb 0
scoreboard players set @a bacapfel_gbm 0
tag @a remove bacapfel_e1
tag @a remove bacapfel_e2
tag @a remove bacapfel_e3
tag @a remove bacapfel_e4
tag @a remove bacapfel_e5
tag @a remove bacapfel_e6
tag @a remove bacapfel_e7
tag @a remove bacapfel_e8
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:speed"}]}] add bacapfel_e1
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:strength"}]}] add bacapfel_e2
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:regeneration"}]}] add bacapfel_e3
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:fire_resistance"}]}] add bacapfel_e4
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:water_breathing"}]}] add bacapfel_e5
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:night_vision"}]}] add bacapfel_e6
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:jump_boost"}]}] add bacapfel_e7
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:invisibility"}]}] add bacapfel_e8

# Count of buffs held, and an eight-bit signature of exactly which ones.
scoreboard players add @a[tag=bacapfel_e1] bacapfel_gb 1
scoreboard players add @a[tag=bacapfel_e1] bacapfel_gbm 1
scoreboard players add @a[tag=bacapfel_e2] bacapfel_gb 1
scoreboard players add @a[tag=bacapfel_e2] bacapfel_gbm 2
scoreboard players add @a[tag=bacapfel_e3] bacapfel_gb 1
scoreboard players add @a[tag=bacapfel_e3] bacapfel_gbm 4
scoreboard players add @a[tag=bacapfel_e4] bacapfel_gb 1
scoreboard players add @a[tag=bacapfel_e4] bacapfel_gbm 8
scoreboard players add @a[tag=bacapfel_e5] bacapfel_gb 1
scoreboard players add @a[tag=bacapfel_e5] bacapfel_gbm 16
scoreboard players add @a[tag=bacapfel_e6] bacapfel_gb 1
scoreboard players add @a[tag=bacapfel_e6] bacapfel_gbm 32
scoreboard players add @a[tag=bacapfel_e7] bacapfel_gb 1
scoreboard players add @a[tag=bacapfel_e7] bacapfel_gbm 64
scoreboard players add @a[tag=bacapfel_e8] bacapfel_gb 1
scoreboard players add @a[tag=bacapfel_e8] bacapfel_gbm 128

execute as @a[gamemode=!spectator,scores={bacapfel_gb=3..}] at @s run function bacapfel:detect/group_buff_group

tag @a remove bacapfel_e1
tag @a remove bacapfel_e2
tag @a remove bacapfel_e3
tag @a remove bacapfel_e4
tag @a remove bacapfel_e5
tag @a remove bacapfel_e6
tag @a remove bacapfel_e7
tag @a remove bacapfel_e8
