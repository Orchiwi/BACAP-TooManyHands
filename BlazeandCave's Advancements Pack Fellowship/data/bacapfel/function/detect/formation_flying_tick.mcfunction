# The formation has to HOLD. A single sample let three players dive through the same
# airspace at 60 m/s and earn it in one frame.
execute store result score #fly bacapfel_tmp4 if entity @a[tag=bacapfel_fly,distance=..10]
execute if score #fly bacapfel_tmp4 matches 3.. run scoreboard players add @s bacapfel_form 1
execute unless score #fly bacapfel_tmp4 matches 3.. run scoreboard players set @s bacapfel_form 0
execute if score @s bacapfel_form matches 4.. run function bacapfel:detect/formation_flying_grant
