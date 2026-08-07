# The formation has to HOLD. A single sample let three players dive through the same
# airspace at 60 m/s and earn it in one frame.
execute store result score #fly bacaptmh_tmp4 if entity @a[tag=bacaptmh_fly,distance=..10]
execute if score #fly bacaptmh_tmp4 matches 3.. run scoreboard players add @s bacaptmh_form 1
execute unless score #fly bacaptmh_tmp4 matches 3.. run scoreboard players set @s bacaptmh_form 0
execute if score @s bacaptmh_form matches 4.. run function bacaptmh:detect/formation_flying_grant
