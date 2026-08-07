# Executed as/at a player who does not hold the advancement and has a Warden in range.
execute as @e[type=warden,distance=..16,limit=1,sort=nearest] at @s run function bacaptmh:detect/warden_party_kill
