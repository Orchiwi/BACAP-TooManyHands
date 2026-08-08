# Sea Legs - riding the roof of somebody else's boat for 200 blocks.
# @s is a non-spectator, non-creative player who does not hold it yet, run at themselves.
scoreboard players set #ok bacaptmh_sl 0
# A passenger of the boat is not standing on it - that is Carpool. `on vehicle` runs only
# when there is a vehicle at all, so this flag is the cheap way to ask "am I riding?".
scoreboard players set #riding bacaptmh_sl 0
execute on vehicle run scoreboard players set #riding bacaptmh_sl 1
# A boat hitbox 0.3 blocks below the feet, with a DIFFERENT player among its passengers.
tag @s add bacaptmh_sl_rider
execute if score #riding bacaptmh_sl matches 0 positioned ~ ~-0.3 ~ as @e[type=#blazeandcave:all_boats,dx=0,dy=0,dz=0,limit=1,sort=nearest] on passengers if entity @s[type=player,tag=!bacaptmh_sl_rider,gamemode=!spectator] run scoreboard players set #ok bacaptmh_sl 1
scoreboard players set #bd bacaptmh_sl -1
execute if score #riding bacaptmh_sl matches 0 positioned ~ ~-0.3 ~ as @e[type=#blazeandcave:all_boats,dx=0,dy=0,dz=0,limit=1,sort=nearest] on passengers if entity @s[type=player,tag=!bacaptmh_sl_rider,gamemode=!spectator] run scoreboard players operation #bd bacaptmh_sl = @s bacaptmh_boat
# The driver's boat statistic is unset until they have ridden one, and the copy above
# then does not run - leaving the PREVIOUS driver's distance in this shared score. -1
# survives only in that case, so treat it as no reading at all and drop the run.
execute if score #bd bacaptmh_sl matches ..-1 run scoreboard players set #ok bacaptmh_sl 0
# Off the boat: the run and the driver snapshot both go away, so nothing can be resumed
# across a gap and no lifetime boat_one_cm total can ever be read as one step.
execute if score #ok bacaptmh_sl matches 0 run scoreboard players set @s bacaptmh_sl 0
execute if score #ok bacaptmh_sl matches 0 run scoreboard players reset @s bacaptmh_slb
# First tick of a run only snapshots, so the first step is always 0.
execute if score #ok bacaptmh_sl matches 1 unless score @s bacaptmh_slb matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_slb = #bd bacaptmh_sl
execute if score #ok bacaptmh_sl matches 1 run scoreboard players operation #step bacaptmh_sl = #bd bacaptmh_sl
execute if score #ok bacaptmh_sl matches 1 run scoreboard players operation #step bacaptmh_sl -= @s bacaptmh_slb
execute if score #ok bacaptmh_sl matches 1 if score #step bacaptmh_sl matches 0..2000 run scoreboard players operation @s bacaptmh_sl += #step bacaptmh_sl
execute if score #ok bacaptmh_sl matches 1 run scoreboard players operation @s bacaptmh_slb = #bd bacaptmh_sl
# 20000 cm = 200 blocks. The driver is a participant and is granted too.
execute if score @s bacaptmh_sl matches 20000.. run advancement grant @s only bacaptmh:biomes/sea_legs
execute if score @s bacaptmh_sl matches 20000.. positioned ~ ~-0.3 ~ as @e[type=#blazeandcave:all_boats,dx=0,dy=0,dz=0,limit=1,sort=nearest] on passengers run advancement grant @s[type=player,tag=!bacaptmh_sl_rider,gamemode=!spectator] only bacaptmh:biomes/sea_legs
execute if score @s bacaptmh_sl matches 20000.. run scoreboard players set @s bacaptmh_sl 0
tag @s remove bacaptmh_sl_rider
