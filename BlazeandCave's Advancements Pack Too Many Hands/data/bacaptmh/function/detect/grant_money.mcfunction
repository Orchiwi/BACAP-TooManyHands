# Executed as and at every player who does not hold Grant Money, every 10 ticks.
# Each of them is BOTH a possible sponsor (his bottle statistic just rose) and a
# possible beneficiary (somebody is emptying a stack at his feet).
scoreboard players add @s bacaptmh_xpb 0
scoreboard players operation @s bacaptmh_gmt = @s bacaptmh_xpb
scoreboard players operation @s bacaptmh_gmt -= @s bacaptmh_xpb_m
scoreboard players operation @s bacaptmh_xpb_m = @s bacaptmh_xpb
# Beneficiary window. bacaptmh_gmn is that window - the level difference it used to hold is
# a one-line subtraction on a fake player now, so no new objective is needed. It ages FIRST,
# before this pass can re-stamp it, and running out clears the tally AND the level baseline.
# Without it the tally was a lifetime total that nothing ever decayed, so simply standing
# near anyone who has ever thrown a bottle crept toward 64 and eventually paid out.
execute if score @s bacaptmh_gmn matches 1.. run scoreboard players remove @s bacaptmh_gmn 10
execute if score @s bacaptmh_gmn matches ..0 run scoreboard players set @s bacaptmh_gmc 0
execute if score @s bacaptmh_gmn matches ..0 run scoreboard players set @s bacaptmh_gmb 0
# Sponsor side. The level snapshot is taken BEFORE the first bottle of a run is credited, so
# the gain is measured from the right base, and it is re-taken every time the tally restarts
# from zero rather than once for the life of the world. It is read from NBT rather than from
# a scoreboard criterion - an unknown criterion would be a parse error, an NBT path is not.
scoreboard players operation #gm_d bacaptmh_gm = @s bacaptmh_gmt
execute if score @s bacaptmh_gmt matches 1.. run scoreboard players set @s bacaptmh_gmw 600
execute if score @s bacaptmh_gmt matches 1.. as @a[gamemode=!spectator,distance=0.1..6] unless score @s bacaptmh_gmc matches 1.. store result score @s bacaptmh_gmb run data get entity @s XpLevel
execute if score @s bacaptmh_gmt matches 1.. as @a[gamemode=!spectator,distance=0.1..6] run scoreboard players operation @s bacaptmh_gmc += #gm_d bacaptmh_gm
execute if score @s bacaptmh_gmt matches 1.. as @a[gamemode=!spectator,distance=0.1..6] run scoreboard players set @s bacaptmh_gmn 600
execute if score @s bacaptmh_gmw matches 1.. run scoreboard players remove @s bacaptmh_gmw 10
# Beneficiary side: a whole stack landed on him inside the thirty-second window and his level
# is above the snapshot taken when that window opened.
scoreboard players set #gm_lvl bacaptmh_gm 0
execute store result score #gm_lvl bacaptmh_gm run data get entity @s XpLevel
scoreboard players operation #gm_lvl bacaptmh_gm -= @s bacaptmh_gmb
execute if score @s bacaptmh_gmc matches 64.. if score #gm_lvl bacaptmh_gm matches 1.. run advancement grant @s only bacaptmh:enchanting/grant_money
execute if score @s bacaptmh_gmc matches 64.. if score #gm_lvl bacaptmh_gm matches 1.. run advancement grant @a[gamemode=!spectator,scores={bacaptmh_gmw=1..},distance=..16] only bacaptmh:enchanting/grant_money
