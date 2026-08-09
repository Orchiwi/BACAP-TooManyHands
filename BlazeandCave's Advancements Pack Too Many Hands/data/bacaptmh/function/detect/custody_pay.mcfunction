# Runs as the animal. Both halves of the pair are credited: whoever just fed it, and
# whoever named it, found by matching the stamp against player ids.
# #cudone closes the nearest-first walk in custody_feed, so one feeding pays out once.
scoreboard players set #cudone bacaptmh_sys 1
scoreboard players operation #cuown bacaptmh_sys = @s bacaptmh_owner
advancement grant @a[tag=bacaptmh_cu_feeder] only bacaptmh:animal/shared_custody
execute as @a[gamemode=!spectator] if score @s bacaptmh_pid = #cuown bacaptmh_sys run advancement grant @s only bacaptmh:animal/shared_custody
