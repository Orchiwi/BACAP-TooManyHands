# Tunnel Vision - executed as/at every seeded survival player every medium tick while
# somebody still lacks it. Stone, deepslate and tuff are what a tunnel is cut through;
# there is no aggregate 'blocks mined' statistic, so the three are summed by hand.
execute store result score #tv_now bacaptmh_tmp run time query gametime
scoreboard players operation @s bacaptmh_mn = @s bacaptmh_ms
scoreboard players operation @s bacaptmh_mn += @s bacaptmh_md
scoreboard players operation @s bacaptmh_mn += @s bacaptmh_mt
scoreboard players operation #tv_d bacaptmh_tmp = @s bacaptmh_mn
scoreboard players operation #tv_d bacaptmh_tmp -= @s bacaptmh_mnm
scoreboard players operation @s bacaptmh_mnm = @s bacaptmh_mn
# Half a second cannot hold two hundred blocks. Anything bigger is a mirror that went stale
# while the gate above was shut, never a burst of digging, so it is thrown away.
execute unless score #tv_d bacaptmh_tmp matches 0..200 run scoreboard players set #tv_d bacaptmh_tmp 0
# A dig ends after ten seconds with nothing broken; the next block starts a fresh one and
# re-plants the dig head. The head is recorded BEFORE the tally is added to.
scoreboard players operation #tv_cut bacaptmh_tmp = #tv_now bacaptmh_tmp
scoreboard players remove #tv_cut bacaptmh_tmp 200
execute unless score @s bacaptmh_tvt > #tv_cut bacaptmh_tmp run scoreboard players set @s bacaptmh_tvn 0
execute if score #tv_d bacaptmh_tmp matches 1.. if score @s bacaptmh_tvn matches 0 store result score @s bacaptmh_tvx run data get entity @s Pos[0]
execute if score #tv_d bacaptmh_tmp matches 1.. if score @s bacaptmh_tvn matches 0 store result score @s bacaptmh_tvz run data get entity @s Pos[2]
execute if score #tv_d bacaptmh_tmp matches 1.. run scoreboard players operation @s bacaptmh_tvt = #tv_now bacaptmh_tmp
execute if score #tv_d bacaptmh_tmp matches 1.. run scoreboard players operation @s bacaptmh_tvn += #tv_d bacaptmh_tmp
# 150 blocks of one continuous dig, underground, with somebody else in arm's reach.
execute unless score @s bacaptmh_tvn matches 150.. run return 0
execute store result score #tv_y bacaptmh_tmp run data get entity @s Pos[1]
execute unless score #tv_y bacaptmh_tmp matches ..50 run return 0
tag @a remove bacaptmh_tv_mate
tag @s add bacaptmh_tv_self
execute as @a[gamemode=!spectator,gamemode=!creative,tag=!bacaptmh_tv_self,distance=..3,scores={bacaptmh_tvn=150..},limit=1,sort=nearest] run tag @s add bacaptmh_tv_mate
tag @s remove bacaptmh_tv_self
execute unless entity @a[tag=bacaptmh_tv_mate,limit=1] run return 0
# The two dig heads have to have started at least 200 blocks apart. Both deltas are clamped
# to 1000 before squaring, so the multiply cannot overflow a 32-bit score.
scoreboard players operation #tv_x bacaptmh_tmp = @s bacaptmh_tvx
scoreboard players operation #tv_z bacaptmh_tmp = @s bacaptmh_tvz
execute as @a[tag=bacaptmh_tv_mate,limit=1] run scoreboard players operation #tv_px bacaptmh_tmp = @s bacaptmh_tvx
execute as @a[tag=bacaptmh_tv_mate,limit=1] run scoreboard players operation #tv_pz bacaptmh_tmp = @s bacaptmh_tvz
scoreboard players operation #tv_px bacaptmh_tmp -= #tv_x bacaptmh_tmp
scoreboard players operation #tv_pz bacaptmh_tmp -= #tv_z bacaptmh_tmp
execute if score #tv_px bacaptmh_tmp matches 1000.. run scoreboard players set #tv_px bacaptmh_tmp 1000
execute if score #tv_px bacaptmh_tmp matches ..-1000 run scoreboard players set #tv_px bacaptmh_tmp -1000
execute if score #tv_pz bacaptmh_tmp matches 1000.. run scoreboard players set #tv_pz bacaptmh_tmp 1000
execute if score #tv_pz bacaptmh_tmp matches ..-1000 run scoreboard players set #tv_pz bacaptmh_tmp -1000
scoreboard players operation #tv_px bacaptmh_tmp *= #tv_px bacaptmh_tmp
scoreboard players operation #tv_pz bacaptmh_tmp *= #tv_pz bacaptmh_tmp
scoreboard players operation #tv_px bacaptmh_tmp += #tv_pz bacaptmh_tmp
execute if score #tv_px bacaptmh_tmp matches 40000.. run advancement grant @s only bacaptmh:mining/tunnel_vision
execute if score #tv_px bacaptmh_tmp matches 40000.. run advancement grant @a[tag=bacaptmh_tv_mate] only bacaptmh:mining/tunnel_vision
tag @a remove bacaptmh_tv_mate
