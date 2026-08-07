# run every tick as each non-spectator, at him. Every projectile watch in this block
# starts from a player for two reasons: a bare @e in a tick function only ever sees the
# dimension the server command source is in (the overworld), so a snowball fight in the
# nether would never have been seen, and an @e with no distance bound walks every loaded
# entity instead of the handful near somebody. The same snowball can be reached from two
# players in the same tick; every path below is idempotent, so that costs nothing.

# Snowball War (A19): 'on origin' switches the chain to the thrower while keeping the
# snowball's position, and the player test drops snow golem, dispenser and Breeze
# projectiles, which have no player origin.
execute if score #f2players bacaptmh_sys matches 4.. as @e[type=minecraft:snowball,distance=..48] at @s on origin if entity @s[type=minecraft:player,gamemode=!spectator,advancements={bacaptmh:weaponry/snowball_war=false}] run function bacaptmh:detect/snowball_hit

# Wind Duel (A25): a Breeze fires minecraft:breeze_wind_charge, a different entity type,
# and a dispenser-fired charge has no origin, so only a player's own throw is followed.
execute if score #f2players bacaptmh_sys matches 2.. as @e[type=minecraft:wind_charge,distance=..48] at @s on origin if entity @s[type=minecraft:player,gamemode=!spectator,advancements={bacaptmh:weaponry/wind_duel=false}] run function bacaptmh:detect/wind_mark

# Falling Out (A21): a live falling anvil stamps whoever is standing under it.
execute if score #f2players bacaptmh_sys matches 2.. as @e[type=minecraft:falling_block,distance=..32,nbt={BlockState:{Name:"minecraft:anvil"}}] at @s run function bacaptmh:detect/anvil_stamp
execute if score #f2players bacaptmh_sys matches 2.. as @e[type=minecraft:falling_block,distance=..32,nbt={BlockState:{Name:"minecraft:chipped_anvil"}}] at @s run function bacaptmh:detect/anvil_stamp
execute if score #f2players bacaptmh_sys matches 2.. as @e[type=minecraft:falling_block,distance=..32,nbt={BlockState:{Name:"minecraft:damaged_anvil"}}] at @s run function bacaptmh:detect/anvil_stamp
