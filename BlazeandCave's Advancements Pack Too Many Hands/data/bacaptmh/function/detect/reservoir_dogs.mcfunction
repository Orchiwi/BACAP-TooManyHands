# Executed as/at a player who does not hold the advancement and has a Wolf within 24
# blocks. Wolves linger at Health 0.0f through their death animation, so a 10-tick
# sampler always catches it.
# Exactly ONE dying wolf is examined per pass, so the dead wolf's owner and the killing
# wolf's owner can never be read out of two different fights happening side by side.
tag @a remove bacaptmh_rd_dead
tag @a remove bacaptmh_rd_win
execute as @e[type=wolf,nbt={Health:0.0f},distance=..24,limit=1,sort=nearest] on owner if entity @s[type=player] run tag @s add bacaptmh_rd_dead
# 'on attacker' resolves to the entity that last damaged the wolf. Requiring that to be a
# wolf, and then taking ITS owner, is what makes this dog against dog rather than a player
# or a mob finishing somebody's pet off.
execute as @e[type=wolf,nbt={Health:0.0f},distance=..24,limit=1,sort=nearest] on attacker if entity @s[type=wolf] on owner if entity @s[type=player] run tag @s add bacaptmh_rd_win
# A loser must exist (so a wild wolf killed by a pet grants nothing) and the winner must
# not be the loser (so one player setting his own two wolves on each other grants nothing).
# Only the winner is granted: the advancement says win.
execute if entity @a[tag=bacaptmh_rd_dead,limit=1] as @a[tag=bacaptmh_rd_win,tag=!bacaptmh_rd_dead,gamemode=!spectator] run advancement grant @s only bacaptmh:animal/reservoir_dogs
tag @a remove bacaptmh_rd_dead
tag @a remove bacaptmh_rd_win
