# Run as A, at A. A's launch point and current position go into shared temps so the inner
# loop can compare another player's scores against them - a per-pair comparison is the only
# way to express 'each landed where the other stood'.
scoreboard players operation #psx bacaptmh_tmp = @s bacaptmh_px
scoreboard players operation #psy bacaptmh_tmp = @s bacaptmh_py
scoreboard players operation #psz bacaptmh_tmp = @s bacaptmh_pz
execute store result score #pcx bacaptmh_tmp run data get entity @s Pos[0] 1
execute store result score #pcy bacaptmh_tmp run data get entity @s Pos[1] 1
execute store result score #pcz bacaptmh_tmp run data get entity @s Pos[2] 1
# A must actually have gone somewhere. Without this, two players standing together and
# throwing pearls at their own feet satisfy every distance test in pearl_check.
scoreboard players operation #pex bacaptmh_tmp = #pcx bacaptmh_tmp
scoreboard players operation #pex bacaptmh_tmp -= #psx bacaptmh_tmp
scoreboard players operation #pez bacaptmh_tmp = #pcz bacaptmh_tmp
scoreboard players operation #pez bacaptmh_tmp -= #psz bacaptmh_tmp
scoreboard players set #pfar bacaptmh_tmp 0
execute unless score #pex bacaptmh_tmp matches -7..7 run scoreboard players set #pfar bacaptmh_tmp 1
execute unless score #pez bacaptmh_tmp matches -7..7 run scoreboard players set #pfar bacaptmh_tmp 1
tag @s add bacaptmh_pswap
execute if score #pfar bacaptmh_tmp matches 1 as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_pw=1..},tag=!bacaptmh_pswap] run function bacaptmh:detect/pearl_check
tag @s remove bacaptmh_pswap
