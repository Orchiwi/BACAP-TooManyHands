# Executed as/at the Warden. 'Nobody dead' is enforced with the death mirror rather than with
# a snapshot of the death screen: a counted player must carry no death stamp from the last
# 1200 ticks, so dying at any point in the last minute of the fight disqualifies them.
execute store result score #f3wahp bacaptmh_tmp run data get entity @s Health 10
execute if score #f3wahp bacaptmh_tmp matches 1.. run return 0
scoreboard players set #f3wan bacaptmh_tmp 0
execute as @a[gamemode=!spectator,gamemode=!creative,distance=..16,nbt=!{Health:0.0f}] unless score @s bacaptmh_dtime > #f3cut1200 bacaptmh_tmp run scoreboard players add #f3wan bacaptmh_tmp 1
execute if score #f3wan bacaptmh_tmp matches 3.. as @a[gamemode=!spectator,gamemode=!creative,distance=..16,nbt=!{Health:0.0f}] unless score @s bacaptmh_dtime > #f3cut1200 bacaptmh_tmp run advancement grant @s only bacaptmh:challenges/warden_party
