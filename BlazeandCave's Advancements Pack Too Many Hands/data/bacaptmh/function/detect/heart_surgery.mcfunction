# Executed as and at the player who has just destroyed a Creaking - in practice by smashing
# its Creaking Heart, which is the only way a player kills one.
# The fixated player is not read here: a Creaking only pursues while unobserved and its target
# is null for long stretches, so the target is SAMPLED every medium tick by the line in
# bucket_medium and stamped on the victim for five seconds. distance=4..64 excludes anyone
# standing on top of the breaker, and the breaker himself, so this can never be a solo grant.
tag @s add bacaptmh_hs_self
execute if entity @a[gamemode=!spectator,tag=!bacaptmh_hs_self,distance=4..64,scores={bacaptmh_hsv=1..},limit=1] run advancement grant @s only bacaptmh:monsters/heart_surgery
execute if entity @a[gamemode=!spectator,tag=!bacaptmh_hs_self,distance=4..64,scores={bacaptmh_hsv=1..},limit=1] run advancement grant @a[gamemode=!spectator,tag=!bacaptmh_hs_self,distance=4..64,scores={bacaptmh_hsv=1..}] only bacaptmh:monsters/heart_surgery
tag @s remove bacaptmh_hs_self
