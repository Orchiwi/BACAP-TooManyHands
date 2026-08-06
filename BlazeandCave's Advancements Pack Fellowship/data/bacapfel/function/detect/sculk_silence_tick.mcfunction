# The two minutes only count while the group is actually together - three players who
# each sat quietly in three separate pockets no longer qualify by converging at the end.
execute store result score #ssn bacapfel_tmp4 if entity @a[tag=bacapfel_dark,distance=..48]
execute if score #ssn bacapfel_tmp4 matches 3.. run scoreboard players add @s bacapfel_dd 1
execute unless score #ssn bacapfel_tmp4 matches 3.. run scoreboard players set @s bacapfel_dd 0
execute if score @s bacapfel_dd matches 24.. run function bacapfel:detect/sculk_silence_group
