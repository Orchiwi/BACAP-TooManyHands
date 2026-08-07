# One NBT scan per effect and nothing else. The old version ran 112 nbt= selector
# evaluations per slow tick, each of which serialises a whole player.
scoreboard players set @a bacaptmh_gb 0
scoreboard players set @a bacaptmh_gbm 0
tag @a remove bacaptmh_e1
tag @a remove bacaptmh_e2
tag @a remove bacaptmh_e3
tag @a remove bacaptmh_e4
tag @a remove bacaptmh_e5
tag @a remove bacaptmh_e6
tag @a remove bacaptmh_e7
tag @a remove bacaptmh_e8
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:speed"}]}] add bacaptmh_e1
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:strength"}]}] add bacaptmh_e2
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:regeneration"}]}] add bacaptmh_e3
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:fire_resistance"}]}] add bacaptmh_e4
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:water_breathing"}]}] add bacaptmh_e5
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:night_vision"}]}] add bacaptmh_e6
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:jump_boost"}]}] add bacaptmh_e7
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:invisibility"}]}] add bacaptmh_e8

# Count of buffs held, and an eight-bit signature of exactly which ones.
scoreboard players add @a[tag=bacaptmh_e1] bacaptmh_gb 1
scoreboard players add @a[tag=bacaptmh_e1] bacaptmh_gbm 1
scoreboard players add @a[tag=bacaptmh_e2] bacaptmh_gb 1
scoreboard players add @a[tag=bacaptmh_e2] bacaptmh_gbm 2
scoreboard players add @a[tag=bacaptmh_e3] bacaptmh_gb 1
scoreboard players add @a[tag=bacaptmh_e3] bacaptmh_gbm 4
scoreboard players add @a[tag=bacaptmh_e4] bacaptmh_gb 1
scoreboard players add @a[tag=bacaptmh_e4] bacaptmh_gbm 8
scoreboard players add @a[tag=bacaptmh_e5] bacaptmh_gb 1
scoreboard players add @a[tag=bacaptmh_e5] bacaptmh_gbm 16
scoreboard players add @a[tag=bacaptmh_e6] bacaptmh_gb 1
scoreboard players add @a[tag=bacaptmh_e6] bacaptmh_gbm 32
scoreboard players add @a[tag=bacaptmh_e7] bacaptmh_gb 1
scoreboard players add @a[tag=bacaptmh_e7] bacaptmh_gbm 64
scoreboard players add @a[tag=bacaptmh_e8] bacaptmh_gb 1
scoreboard players add @a[tag=bacaptmh_e8] bacaptmh_gbm 128

execute as @a[gamemode=!spectator,scores={bacaptmh_gb=3..}] at @s run function bacaptmh:detect/group_buff_group

tag @a remove bacaptmh_e1
tag @a remove bacaptmh_e2
tag @a remove bacaptmh_e3
tag @a remove bacaptmh_e4
tag @a remove bacaptmh_e5
tag @a remove bacaptmh_e6
tag @a remove bacaptmh_e7
tag @a remove bacaptmh_e8
