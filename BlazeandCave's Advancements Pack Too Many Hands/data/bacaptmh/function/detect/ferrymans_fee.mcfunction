# Executed as/at a non-spectator, non-creative player who does not hold the advancement.
# boat_one_cm is awarded to passengers as well as to whoever is steering, so both people in the
# boat accumulate independently and both cross the line on the same pass.
scoreboard players add @s bacaptmh_boat 0
scoreboard players operation @s bacaptmh_boatd = @s bacaptmh_boat
scoreboard players operation @s bacaptmh_boatd -= @s bacaptmh_boatm
scoreboard players operation @s bacaptmh_boatm = @s bacaptmh_boat
# 'on vehicle ... on passengers' walks the real passenger list of the boat this player is sitting
# in, so a second boat drawn up alongside is never mistaken for a passenger.
scoreboard players set #mp4fer bacaptmh_tmp 0
execute as @s on vehicle if entity @s[type=#blazeandcave:all_boats] on passengers if entity @s[type=player,gamemode=!spectator,gamemode=!creative] run scoreboard players add #mp4fer bacaptmh_tmp 1
# Anything other than two aboard - stepping out, the passenger logging off - resets the voyage.
execute unless score #mp4fer bacaptmh_tmp matches 2.. run scoreboard players set @s bacaptmh_ferry 0
# The delta is clamped to one window's worth of sailing (twenty blocks), so even a mirror that
# somehow escaped seeding cannot dump a lifetime boat total into the counter in a single pass.
execute if score #mp4fer bacaptmh_tmp matches 2.. if score @s bacaptmh_boatd matches 1..2000 run scoreboard players operation @s bacaptmh_ferry += @s bacaptmh_boatd
# 200000 cm is 2000 blocks. Everybody in the boat is paid, not just whoever tripped the check.
execute if score @s bacaptmh_ferry matches 200000.. as @s on vehicle on passengers if entity @s[type=player,gamemode=!spectator,gamemode=!creative] run advancement grant @s only bacaptmh:biomes/ferrymans_fee
