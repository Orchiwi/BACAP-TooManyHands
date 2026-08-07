# @s has just been poisoned BY ANOTHER PLAYER (the 'gassed' criterion's source predicate).
# Poisonous potatoes, spider eyes, suspicious stew, pufferfish and cave spiders pass no
# player source at all, so they cannot reach this function.
advancement revoke @s only bacaptmh:potion/chemical_warfare gassed

# ...and only a lingering Poison cloud they are standing in counts. Matching the cloud's
# own contents keeps Dragon's Breath and a Lingering Potion of Swiftness out.
execute if entity @e[type=minecraft:area_effect_cloud,distance=..6,nbt={potion_contents:{potion:"minecraft:poison"}},limit=1] run scoreboard players set @s bacaptmh_gas 8
execute if entity @e[type=minecraft:area_effect_cloud,distance=..6,nbt={potion_contents:{potion:"minecraft:strong_poison"}},limit=1] run scoreboard players set @s bacaptmh_gas 8
execute if entity @e[type=minecraft:area_effect_cloud,distance=..6,nbt={potion_contents:{potion:"minecraft:long_poison"}},limit=1] run scoreboard players set @s bacaptmh_gas 8

execute if score @s bacaptmh_gas matches 1.. run function bacaptmh:detect/chemical_warfare_group
