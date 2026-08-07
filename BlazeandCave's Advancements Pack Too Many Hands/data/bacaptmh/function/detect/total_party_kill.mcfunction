# A wipe is 'every eligible player carries a death stamp from the last ten seconds'. The stamp
# is set in detect/sample from a consumed deathCount mirror, so it is set even under
# doImmediateRespawn and cannot be missed by a player who respawns between two samples.
scoreboard players set #f3tpkn bacaptmh_tmp 0
scoreboard players set #f3tpkd bacaptmh_tmp 0
execute as @a[gamemode=!spectator,gamemode=!creative] run scoreboard players add #f3tpkn bacaptmh_tmp 1
execute as @a[gamemode=!spectator,gamemode=!creative] if score @s bacaptmh_dtime > #f3cut200 bacaptmh_tmp run scoreboard players add #f3tpkd bacaptmh_tmp 1
execute if score #f3tpkn bacaptmh_tmp matches 3.. if score #f3tpkd bacaptmh_tmp = #f3tpkn bacaptmh_tmp run advancement grant @a[gamemode=!spectator,gamemode=!creative] only bacaptmh:monsters/total_party_kill
