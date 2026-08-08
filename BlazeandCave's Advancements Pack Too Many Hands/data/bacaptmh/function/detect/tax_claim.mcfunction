# Run as a player whose experience just went up, at that player. Their position goes into
# shared temps and every OTHER player with a live death window is measured against the
# block they died on, not against where they are standing now.
tag @s add bacaptmh_taxman
execute store result score #tcx bacaptmh_tmp run data get entity @s Pos[0] 1
execute store result score #tcy bacaptmh_tmp run data get entity @s Pos[1] 1
execute store result score #tcz bacaptmh_tmp run data get entity @s Pos[2] 1
scoreboard players set #taxok bacaptmh_tmp 0
execute as @a[scores={bacaptmh_tw=1..},tag=!bacaptmh_taxman] run function bacaptmh:detect/tax_near
execute if score #taxok bacaptmh_tmp matches 1 run advancement grant @a[tag=bacaptmh_taxed] only bacaptmh:statistics/death_and_taxes
execute if score #taxok bacaptmh_tmp matches 1 run advancement grant @s only bacaptmh:statistics/death_and_taxes
tag @a[tag=bacaptmh_taxed] remove bacaptmh_taxed
tag @s remove bacaptmh_taxman
