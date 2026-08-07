# The window is fixed, not rolling: only the first blast of a chain opens the five
# seconds, so four instruments really do have to sound inside five seconds of the first
# one instead of a relay of blasts under five seconds apart dragging on indefinitely.
tag @s add bacaptmh_horn
execute unless score #timer bacaptmh_horn matches 1.. run scoreboard players set #timer bacaptmh_horn 10
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:ponder_goat_horn"] run scoreboard players set #ponder bacaptmh_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:sing_goat_horn"] run scoreboard players set #sing bacaptmh_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:seek_goat_horn"] run scoreboard players set #seek bacaptmh_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:feel_goat_horn"] run scoreboard players set #feel bacaptmh_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:admire_goat_horn"] run scoreboard players set #admire bacaptmh_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:call_goat_horn"] run scoreboard players set #call bacaptmh_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:yearn_goat_horn"] run scoreboard players set #yearn bacaptmh_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:dream_goat_horn"] run scoreboard players set #dream bacaptmh_horn 1
