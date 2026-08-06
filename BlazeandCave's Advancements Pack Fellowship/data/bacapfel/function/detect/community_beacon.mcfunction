# Beacons hand out their effects with ambient set; drinking or splashing a potion never
# does. This is the same discriminator BACAP uses in nether/beacon_overlord.
tag @a remove bacapfel_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:speed",ambient:1b}]}] add bacapfel_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:haste",ambient:1b}]}] add bacapfel_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:resistance",ambient:1b}]}] add bacapfel_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:jump_boost",ambient:1b}]}] add bacapfel_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:strength",ambient:1b}]}] add bacapfel_beacon
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:regeneration",ambient:1b}]}] add bacapfel_beacon
execute as @a[tag=bacapfel_beacon] at @s run function bacapfel:detect/community_beacon_group
tag @a remove bacapfel_beacon
