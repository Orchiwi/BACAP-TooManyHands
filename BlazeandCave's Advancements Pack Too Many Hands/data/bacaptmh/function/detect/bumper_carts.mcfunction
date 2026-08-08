# Executed as/at a non-spectator, non-creative player who does not hold the advancement, once per
# medium tick. bacaptmh_cartd is the minecart_one_cm delta produced by detect/sample, which is
# ungated and seeds its own baseline, so a parked player can never be credited with a lifetime
# total. bacaptmh_bcprev is the PREVIOUS window's delta and is refreshed by an ungated bucket line
# that runs after this one - refreshing it in here would mean whichever of the two riders the
# bucket processed first had already overwritten their own previous value, and the collision
# would only ever be visible from one side.
scoreboard players set #mp4bc bacaptmh_tmp 0
execute as @s on vehicle if entity @s[type=minecart] run scoreboard players set #mp4bc bacaptmh_tmp 1
# Rolling hard last window (400 cm in ten ticks is roughly full speed), stopped dead this one,
# with a second rider who did exactly the same thing a couple of blocks away. distance=0.5..
# means two people sharing one cart cannot qualify.
execute if score #mp4bc bacaptmh_tmp matches 1 if score @s bacaptmh_bcprev matches 400.. if score @s bacaptmh_cartd matches ..20 if entity @a[gamemode=!spectator,gamemode=!creative,distance=0.5..3.5,scores={bacaptmh_bcprev=400..,bacaptmh_cartd=..20}] run advancement grant @a[gamemode=!spectator,gamemode=!creative,distance=..4] only bacaptmh:redstone/bumper_carts
