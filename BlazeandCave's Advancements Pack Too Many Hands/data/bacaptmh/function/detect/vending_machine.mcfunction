# Vending Machine - executed as/at a customer, from two dispatch lines: standing on a
# Hopper, or inside the ten-second window that paying into one opens. Each half re-tests
# its own condition, so the two entry points cannot cross-trigger.
# Payment: an Emerald on the floor within two blocks of a customer stood on a Hopper.
execute if block ~ ~-1 ~ minecraft:hopper if entity @e[type=item,distance=..2,limit=4,nbt={Item:{id:"minecraft:emerald"}}] run scoreboard players set @s bacaptmh_vmt 200
execute unless score @s bacaptmh_vmt matches 1.. run return 0
# Payout: an item lying against a Dispenser that nobody threw. A thrown item always carries
# a Thrower tag, a dispensed one never does, which is what stops a hand-dropped decoy.
scoreboard players set #vm bacaptmh_tmp 0
execute as @e[type=item,distance=..6,limit=8,sort=nearest] at @s unless data entity @s Thrower unless data entity @s Item{id:"minecraft:emerald"} if block ~ ~ ~ minecraft:dispenser run scoreboard players set #vm bacaptmh_tmp 1
execute as @e[type=item,distance=..6,limit=8,sort=nearest] at @s unless data entity @s Thrower unless data entity @s Item{id:"minecraft:emerald"} if block ~1 ~ ~ minecraft:dispenser run scoreboard players set #vm bacaptmh_tmp 1
execute as @e[type=item,distance=..6,limit=8,sort=nearest] at @s unless data entity @s Thrower unless data entity @s Item{id:"minecraft:emerald"} if block ~-1 ~ ~ minecraft:dispenser run scoreboard players set #vm bacaptmh_tmp 1
execute as @e[type=item,distance=..6,limit=8,sort=nearest] at @s unless data entity @s Thrower unless data entity @s Item{id:"minecraft:emerald"} if block ~ ~1 ~ minecraft:dispenser run scoreboard players set #vm bacaptmh_tmp 1
execute as @e[type=item,distance=..6,limit=8,sort=nearest] at @s unless data entity @s Thrower unless data entity @s Item{id:"minecraft:emerald"} if block ~ ~-1 ~ minecraft:dispenser run scoreboard players set #vm bacaptmh_tmp 1
execute as @e[type=item,distance=..6,limit=8,sort=nearest] at @s unless data entity @s Thrower unless data entity @s Item{id:"minecraft:emerald"} if block ~ ~ ~1 minecraft:dispenser run scoreboard players set #vm bacaptmh_tmp 1
execute as @e[type=item,distance=..6,limit=8,sort=nearest] at @s unless data entity @s Thrower unless data entity @s Item{id:"minecraft:emerald"} if block ~ ~ ~-1 minecraft:dispenser run scoreboard players set #vm bacaptmh_tmp 1
# The shopkeeper has to be somebody else who built both halves of the machine. distance=1..
# excludes the customer themself, so a lone player cannot vend to themselves.
scoreboard players set #vmo bacaptmh_tmp 0
execute if score #vm bacaptmh_tmp matches 1 if entity @a[gamemode=!spectator,distance=1..32,advancements={bacaptmh:redstone/vending_machine={hopper=true,dispenser=true,impossible=false}}] run scoreboard players set #vmo bacaptmh_tmp 1
execute if score #vmo bacaptmh_tmp matches 1 run advancement grant @a[gamemode=!spectator,distance=1..32,advancements={bacaptmh:redstone/vending_machine={hopper=true,dispenser=true,impossible=false}}] only bacaptmh:redstone/vending_machine
execute if score #vmo bacaptmh_tmp matches 1 run advancement grant @s only bacaptmh:redstone/vending_machine
execute if score #vmo bacaptmh_tmp matches 1 run scoreboard players set @s bacaptmh_vmt 0
