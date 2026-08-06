# The window is fixed, not rolling: only the first blast of a chain opens the five
# seconds, so four instruments really do have to sound inside five seconds of the first
# one instead of a relay of blasts under five seconds apart dragging on indefinitely.
tag @s add bacapfel_horn
execute unless score #timer bacapfel_horn matches 1.. run scoreboard players set #timer bacapfel_horn 10
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:ponder_goat_horn"] run scoreboard players set #ponder bacapfel_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:sing_goat_horn"] run scoreboard players set #sing bacapfel_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:seek_goat_horn"] run scoreboard players set #seek bacapfel_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:feel_goat_horn"] run scoreboard players set #feel bacapfel_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:admire_goat_horn"] run scoreboard players set #admire bacapfel_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:call_goat_horn"] run scoreboard players set #call bacapfel_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:yearn_goat_horn"] run scoreboard players set #yearn bacapfel_horn 1
execute if items entity @s weapon.* minecraft:goat_horn[minecraft:instrument="minecraft:dream_goat_horn"] run scoreboard players set #dream bacapfel_horn 1
