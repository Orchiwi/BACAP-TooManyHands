# Called unconditionally from bucket_slow, so the shared death counter is consumed every
# window whether or not a streak is running. #players is set by detect/f4_count at the top
# of bucket_slow - players are COUNTED, never tested with 'if entity @a[limit=N]'.
# Any death anywhere breaks the streak. bacaptmh_ndtd is a vanilla deathCount objective, so
# it ticks up even with doImmediateRespawn on, and it is zeroed here so one death can only
# ever break the streak once. Each player's counter is zeroed the first time bacaptmh:seed
# sees them, so a lifetime death total can never be read as a fresh death.
execute if entity @a[scores={bacaptmh_ndtd=1..},limit=1] run scoreboard players set #streak bacaptmh_ndt 0
scoreboard players set @a bacaptmh_ndtd 0
# Fewer than three players online is itself a break - the headcount has to hold all week.
execute unless score #players bacaptmh_sys matches 3.. run scoreboard players set #streak bacaptmh_ndt 0
execute if score #players bacaptmh_sys matches 3.. run scoreboard players add #streak bacaptmh_ndt 100
# 168000 ticks = seven in-game days. Everyone online shares the payout, not just whoever
# happened to trip the check - Cooperative Mode is off.
execute if score #streak bacaptmh_ndt matches 168000.. run advancement grant @a[gamemode=!spectator] only bacaptmh:challenges/nobody_dies_tonight
execute if score #streak bacaptmh_ndt matches 168000.. run scoreboard players set #streak bacaptmh_ndt 0
