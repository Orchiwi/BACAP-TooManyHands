# Called from bucket_medium when at least two players are online and at least one still
# lacks the advancement. Both halves are latched as ordinary criteria and revoked here the
# moment they are seen, so neither can sit latched for days waiting to meet the other:
# what survives is a 20-window (10 second) timer, nothing else.
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/night_watch={slept=true,guard=false}}] run scoreboard players set @s bacaptmh_nws 20
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/night_watch={slept=true,guard=false}}] run advancement revoke @s only bacaptmh:monsters/night_watch slept
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/night_watch={killed=true,guard=false}}] run scoreboard players set @s bacaptmh_nwk 20
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/night_watch={killed=true,guard=false}}] run advancement revoke @s only bacaptmh:monsters/night_watch killed
# Pair a sleeper with a guard within ten blocks. distance=1..10, never 0..10, so a player
# who both slept and killed cannot pair with himself.
# minecraft:slept_in_bed fires on ENTERING the bed, so the window alone would pay out a
# bed-bounce: in and straight back out while a partner clears mobs. LivingEntity writes
# SleepingX/Y/Z only while it actually holds a sleeping position, so the data check is the
# test for 'still asleep right now' and the window is only the tolerance around it.
execute as @a[gamemode=!spectator,scores={bacaptmh_nws=1..}] if data entity @s SleepingX at @s if entity @a[gamemode=!spectator,distance=1..10,scores={bacaptmh_nwk=1..}] run advancement grant @s only bacaptmh:monsters/night_watch
execute as @a[gamemode=!spectator,scores={bacaptmh_nws=1..}] if data entity @s SleepingX at @s run advancement grant @a[gamemode=!spectator,distance=1..10,scores={bacaptmh_nwk=1..}] only bacaptmh:monsters/night_watch
scoreboard players remove @a[scores={bacaptmh_nws=1..}] bacaptmh_nws 1
scoreboard players remove @a[scores={bacaptmh_nwk=1..}] bacaptmh_nwk 1
