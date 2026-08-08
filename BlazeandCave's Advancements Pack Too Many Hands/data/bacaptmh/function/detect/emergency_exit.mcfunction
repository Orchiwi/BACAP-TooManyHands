# @s has just stepped out of a Nether portal into the Overworld ('escaped' latched,
# impossible guard still false). Consume the criterion first so a failed match cannot
# re-fire it every cycle.
advancement revoke @s only bacaptmh:nether/emergency_exit escaped

# Open a five-second window (10 medium ticks) and record whether this one is the wounded
# one. Health is read at scale 10 and tested 1..39, i.e. 0.1 to 3.9 HP: under two hearts,
# with a dead player's flat 0 thrown out.
scoreboard players set @s bacaptmh_exit 10
scoreboard players set @s bacaptmh_ehurt 0
scoreboard players set #ee bacaptmh_mp6 0
execute store result score #ee bacaptmh_mp6 run data get entity @s Health 10
execute if score #ee bacaptmh_mp6 matches 1..39 run scoreboard players set @s bacaptmh_ehurt 1

# A partner is somebody else who came out of the Nether inside the same five seconds and
# is still within sixteen blocks. At least one of the pair has to be the wounded one, so
# the search is asymmetric: a wounded arrival accepts any partner, a healthy arrival only
# accepts a wounded one. distance=1..16 excludes @s from his own search.
scoreboard players set #eep bacaptmh_mp6 0
execute if score @s bacaptmh_ehurt matches 1 store result score #eep bacaptmh_mp6 if entity @a[gamemode=!spectator,distance=1..16,scores={bacaptmh_exit=1..}]
execute if score @s bacaptmh_ehurt matches 0 store result score #eep bacaptmh_mp6 if entity @a[gamemode=!spectator,distance=1..16,scores={bacaptmh_exit=1..,bacaptmh_ehurt=1}]
execute if score #eep bacaptmh_mp6 matches 1.. run advancement grant @s only bacaptmh:nether/emergency_exit
execute if score #eep bacaptmh_mp6 matches 1.. run advancement grant @a[gamemode=!spectator,distance=1..16,scores={bacaptmh_exit=1..}] only bacaptmh:nether/emergency_exit
