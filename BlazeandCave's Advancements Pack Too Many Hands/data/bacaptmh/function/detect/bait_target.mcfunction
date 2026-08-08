# Run as the Warden's current target, at it. It counts only if it is some OTHER player and
# the looter is at least thirty blocks away from it.
execute if entity @s[type=player,gamemode=!spectator,tag=!bacaptmh_looter] if entity @a[tag=bacaptmh_looter,distance=30..,limit=1] run scoreboard players set #baitok bacaptmh_tmp 1
execute if entity @s[type=player,gamemode=!spectator,tag=!bacaptmh_looter] if entity @a[tag=bacaptmh_looter,distance=30..,limit=1] run tag @s add bacaptmh_bait
