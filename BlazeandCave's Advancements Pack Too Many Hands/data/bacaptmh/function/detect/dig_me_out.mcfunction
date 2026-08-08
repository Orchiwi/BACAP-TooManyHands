# Called unconditionally from bucket_medium. The three statistic lines below are NEVER
# gated on advancement state or player count: a mirror that freezes while somebody is
# offline would read a whole lifetime of gravel as one dig the moment it thawed. The
# mirror itself is created in bacaptmh:seed, before any detector runs.
scoreboard players remove @a[scores={bacaptmh_gravt=1..}] bacaptmh_gravt 1
execute as @a[gamemode=!spectator] if score @s bacaptmh_grav > @s bacaptmh_gravm run scoreboard players set @s bacaptmh_gravt 3
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_gravm = @s bacaptmh_grav
# Buried: the block at head height is Gravel and somebody else is close enough to dig.
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:mining/dig_me_out=false}] at @s if block ~ ~1 ~ minecraft:gravel if entity @a[gamemode=!spectator,distance=1..6,limit=1] run scoreboard players set @s bacaptmh_bury 3
# Freed: the head block is gone, this player mined no gravel himself (so he cannot claim
# his own rescue), and a different player within six blocks did. Both sides are paid.
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_bury=1..},advancements={bacaptmh:mining/dig_me_out=false}] at @s unless block ~ ~1 ~ minecraft:gravel unless score @s bacaptmh_gravt matches 1.. if entity @a[gamemode=!spectator,gamemode=!creative,distance=1..6,scores={bacaptmh_gravt=1..},limit=1] run advancement grant @s only bacaptmh:mining/dig_me_out
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_bury=1..}] at @s unless block ~ ~1 ~ minecraft:gravel unless score @s bacaptmh_gravt matches 1.. run advancement grant @a[gamemode=!spectator,gamemode=!creative,distance=1..6,scores={bacaptmh_gravt=1..}] only bacaptmh:mining/dig_me_out
scoreboard players remove @a[scores={bacaptmh_bury=1..}] bacaptmh_bury 1
