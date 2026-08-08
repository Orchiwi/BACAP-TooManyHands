# The Relay. Executed as/at every non-spectator on a medium tick, while three or more are online
# and somebody still lacks it. Boss deaths are read from the vanilla kill statistics rather than
# by walking entities and polling Health, so there is no @e scan here at all.
#
# A boss counts only if some OTHER player died in the last 1200 ticks. bacaptmh_dtime is the
# death stamp the pack's existing detect/sample maintains UNGATED for every non-spectator, and
# #f3cut1200 is set by bucket_medium before this runs. The finisher is tagged out of the count,
# so dying to your own boss and then killing it yourself proves nothing.
scoreboard players set #fallen bacaptmh_m9 0
tag @s add bacaptmh_finisher
execute as @a[gamemode=!spectator,tag=!bacaptmh_finisher] if score @s bacaptmh_dtime > #f3cut1200 bacaptmh_tmp run scoreboard players add #fallen bacaptmh_m9 1
tag @s remove bacaptmh_finisher

# One flag per boss. Mirrors are consumed at the end of bucket_medium, after Noble Sacrifice has
# read the same Wither delta.
execute if score #fallen bacaptmh_m9 matches 1.. if score @s bacaptmh_kwither > @s bacaptmh_kwitherp run scoreboard players set #wither bacaptmh_relay 1
execute if score #fallen bacaptmh_m9 matches 1.. if score @s bacaptmh_kwarden > @s bacaptmh_kwardenp run scoreboard players set #warden bacaptmh_relay 1
execute if score #fallen bacaptmh_m9 matches 1.. if score @s bacaptmh_kdragon > @s bacaptmh_kdragonp run scoreboard players set #dragon bacaptmh_relay 1

# All three standing pays the crew present at the last kill and then consumes the flags,
# so the next relay has to be run from scratch.
execute if score #wither bacaptmh_relay matches 1 if score #warden bacaptmh_relay matches 1 if score #dragon bacaptmh_relay matches 1 run function bacaptmh:detect/relay_grant
