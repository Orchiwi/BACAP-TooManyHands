# Executed as/at the Ender Dragon, inside the End - the same sampler as detect/tag_team, but
# on its own private stamp objective so it does not go dark once everybody holds Tag Team and
# that detector stops being dispatched.
scoreboard players operation #g13prev bacaptmh_tmp = #g13hp bacaptmh_tmp
execute store result score #g13hp bacaptmh_tmp run data get entity @s Health 10
# A drop in the dragon's health means somebody just wounded it. Everyone within 128 blocks
# whose damage_dealt delta is positive in that same window is stamped. The delta comes from
# detect/sample, which runs ungated for every non-spectator and seeds its baseline the first
# time it sees a player, so an arriving player's lifetime damage_dealt can never be read as a
# hit on the dragon.
execute if score #g13hp bacaptmh_tmp < #g13prev bacaptmh_tmp as @a[gamemode=!spectator,gamemode=!creative,distance=..128,scores={bacaptmh_dmgd=1..}] run scoreboard players operation @s bacaptmh_gpt = #f3now bacaptmh_tmp
execute if score #g13hp bacaptmh_tmp matches 1.. run return 0
# Health 0: the dragon is playing its death animation, so there are many sampling chances.
# Count the wounders stamped in the last two minutes, then count how many of those also carry
# a death stamp under two minutes old. Everybody who fought must have gone down at least once,
# so the two counts have to be equal, and there have to be at least three of them.
scoreboard players set #g13n bacaptmh_tmp 0
scoreboard players set #g13d bacaptmh_tmp 0
execute as @a[gamemode=!spectator,distance=..256] if score @s bacaptmh_gpt > #f3cut2400 bacaptmh_tmp run scoreboard players add #g13n bacaptmh_tmp 1
execute as @a[gamemode=!spectator,distance=..256] if score @s bacaptmh_gpt > #f3cut2400 bacaptmh_tmp if score @s bacaptmh_dtime > #f3cut2400 bacaptmh_tmp run scoreboard players add #g13d bacaptmh_tmp 1
execute if score #g13n bacaptmh_tmp matches 3.. if score #g13d bacaptmh_tmp = #g13n bacaptmh_tmp as @a[gamemode=!spectator,distance=..256] if score @s bacaptmh_gpt > #f3cut2400 bacaptmh_tmp run advancement grant @s only bacaptmh:end/ghost_protocol
