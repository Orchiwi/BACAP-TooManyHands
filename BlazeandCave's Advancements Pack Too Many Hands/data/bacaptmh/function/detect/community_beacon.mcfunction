# Beacons hand out their effects with ambient set; drinking or splashing a potion never
# does. This is the same discriminator BACAP uses in nether/beacon_overlord.
tag @a remove bacaptmh_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:speed",ambient:1b}]}] add bacaptmh_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:haste",ambient:1b}]}] add bacaptmh_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:resistance",ambient:1b}]}] add bacaptmh_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:jump_boost",ambient:1b}]}] add bacaptmh_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:strength",ambient:1b}]}] add bacaptmh_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:regeneration",ambient:1b}]}] add bacaptmh_beacon
execute as @a[tag=bacaptmh_beacon] at @s run function bacaptmh:detect/community_beacon_group
tag @a remove bacaptmh_beacon
