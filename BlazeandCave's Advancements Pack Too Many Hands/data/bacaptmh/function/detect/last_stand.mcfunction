# Executed as and at the player who has just killed a Warden (fast bucket).
# The party is the ROSTER, never the server: bacaptmh_ls_join is stamped in bucket_medium on
# everybody who stood within forty-eight blocks of a live Warden in the last two minutes, so
# two AFK players dying in a mob grinder on the far side of the world can no longer stand in
# for the people who were actually in the fight.
# 'Already dead' is bacaptmh_dtime against #f3cut1200 - a 60-second window. That cutoff is
# refreshed in the medium bucket, so it can be up to nine ticks stale here, which is harmless
# at this scale.
scoreboard players set #ls_party bacaptmh_ls 0
scoreboard players set #ls_fallen bacaptmh_ls 0
tag @s add bacaptmh_ls_self
execute as @a[gamemode=!spectator,tag=!bacaptmh_ls_self,scores={bacaptmh_lsj=1..}] run scoreboard players add #ls_party bacaptmh_ls 1
execute as @a[gamemode=!spectator,tag=!bacaptmh_ls_self,scores={bacaptmh_lsj=1..}] if score @s bacaptmh_dtime > #f3cut1200 bacaptmh_tmp run scoreboard players add #ls_fallen bacaptmh_ls 1
tag @s remove bacaptmh_ls_self
# Two or more others joined this fight and every last one of them is already down. The fallen
# party is granted alongside the survivor - Cooperative Mode is off.
execute if score #ls_party bacaptmh_ls matches 2.. if score #ls_party bacaptmh_ls = #ls_fallen bacaptmh_ls run advancement grant @s only bacaptmh:monsters/last_stand
execute if score #ls_party bacaptmh_ls matches 2.. if score #ls_party bacaptmh_ls = #ls_fallen bacaptmh_ls run advancement grant @a[gamemode=!spectator,scores={bacaptmh_lsj=1..}] only bacaptmh:monsters/last_stand
