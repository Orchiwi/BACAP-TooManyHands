# Executed as/at the Ender Dragon, inside the End.
# A drop in the dragon's health since the last sample means somebody just wounded it.
scoreboard players operation #f3dgprev bacaptmh_tmp = #f3dghp bacaptmh_tmp
execute store result score #f3dghp bacaptmh_tmp run data get entity @s Health 10
# Everyone within 128 blocks whose damage_dealt delta is positive in that same window is a
# wounder. The delta comes from detect/sample, which is ungated and self-seeding, so an
# arriving player's lifetime damage_dealt can never be mistaken for a hit on the dragon.
execute if score #f3dghp bacaptmh_tmp < #f3dgprev bacaptmh_tmp as @a[gamemode=!spectator,gamemode=!creative,distance=..128,scores={bacaptmh_dmgd=1..}] run scoreboard players operation @s bacaptmh_dgt = #f3now bacaptmh_tmp
execute if score #f3dghp bacaptmh_tmp matches 1.. run return 0
# Health 0: the dragon is playing its death animation. Count wounders stamped in the last two
# minutes and grant when there are at least two of them. The stamp is per-player and expires,
# so nothing is left behind between fights.
scoreboard players set #f3dgn bacaptmh_tmp 0
execute as @a[gamemode=!spectator,distance=..256] if score @s bacaptmh_dgt > #f3cut2400 bacaptmh_tmp run scoreboard players add #f3dgn bacaptmh_tmp 1
execute if score #f3dgn bacaptmh_tmp matches 2.. as @a[gamemode=!spectator,distance=..256] if score @s bacaptmh_dgt > #f3cut2400 bacaptmh_tmp run advancement grant @s only bacaptmh:end/tag_team
