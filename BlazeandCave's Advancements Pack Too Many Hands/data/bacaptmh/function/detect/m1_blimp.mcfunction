# Executed as/at a non-spectator, non-creative player who does not hold Blimpin' Ain't Easy.
# The run only accrues while this player is riding an AIRBORNE Happy Ghast that is also
# carrying a second player. Anything else - dismounting, the passenger leaving, the ghast
# settling on the ground - zeroes the tally, which is what 'without landing' means here.
# The 0.5 block floor is what stops the rider counting as his own passenger: after 'on
# passengers' the position context is still this player's, so he measures 0.0 from himself.
scoreboard players set #m1bok bacaptmh_sys 0
execute on vehicle if entity @s[type=minecraft:happy_ghast,nbt=!{OnGround:1b}] on passengers if entity @s[type=player,gamemode=!spectator,distance=0.5..] run scoreboard players set #m1bok bacaptmh_sys 1
execute if score #m1bok bacaptmh_sys matches 0 run scoreboard players set @s bacaptmh_m1blimp 0
execute if score #m1bok bacaptmh_sys matches 0 run return 0
# bacaptmh_m1ghd is the happy_ghast_one_cm delta for this window, produced in the bucket from
# a mirror seeded before any detector runs, so a lifetime total is never banked as one flight.
scoreboard players operation @s bacaptmh_m1blimp += @s bacaptmh_m1ghd
# 5 km. Grant every player aboard, not only whoever tripped the check.
execute if score @s bacaptmh_m1blimp matches 500000.. on vehicle on passengers if entity @s[type=player,gamemode=!spectator] run advancement grant @s only bacaptmh:statistics/blimpin_aint_easy
