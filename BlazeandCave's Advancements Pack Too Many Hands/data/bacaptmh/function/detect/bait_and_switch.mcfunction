# Run as the looter, at the looter. The loot criterion is a one-shot flag, but a Warden's
# target is null for whole ticks at a time, so the flag is held open for ten seconds
# instead of being consumed on the first pass.
scoreboard players add @s bacaptmh_baitw 1
execute if score @s bacaptmh_baitw matches 200.. run scoreboard players set @s bacaptmh_baitw 0
execute if score @s bacaptmh_baitw matches 0 run advancement revoke @s only bacaptmh:monsters/bait_and_switch
tag @s add bacaptmh_looter
scoreboard players set #baitok bacaptmh_tmp 0
execute as @e[type=warden,distance=..96,limit=4,sort=nearest] on target at @s run function bacaptmh:detect/bait_target
execute if score #baitok bacaptmh_tmp matches 1 run scoreboard players set @s bacaptmh_baitw 0
execute if score #baitok bacaptmh_tmp matches 1 run advancement grant @a[tag=bacaptmh_bait] only bacaptmh:monsters/bait_and_switch
execute if score #baitok bacaptmh_tmp matches 1 run advancement grant @s only bacaptmh:monsters/bait_and_switch
tag @a[tag=bacaptmh_bait] remove bacaptmh_bait
tag @s remove bacaptmh_looter
