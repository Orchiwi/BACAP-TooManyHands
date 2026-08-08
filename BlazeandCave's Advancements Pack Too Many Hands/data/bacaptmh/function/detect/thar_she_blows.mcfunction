# @s killed a Drowned with a thrown Trident while seated in a boat (the 'harpooned'
# criterion pins killing_blow to a trident projectile and player.vehicle to
# #blazeandcave:all_boats). requirements are [["harpooned"],["impossible"]], so the
# latch on its own never completes the advancement.
# Consume the criterion FIRST, whatever happens next, so a failed match cannot leave it
# latched and re-fire every single tick.
advancement revoke @s only bacaptmh:biomes/thar_she_blows harpooned

# Players are never written into a vehicle's Passengers NBT, so walk the passengers the
# way carpool.mcfunction does rather than trying to read the boat.
scoreboard players set #tsb bacaptmh_mp6 0
execute on vehicle if entity @s[type=#blazeandcave:all_boats] on passengers if entity @s[type=player,gamemode=!spectator] run scoreboard players add #tsb bacaptmh_mp6 1
# Two people aboard means somebody else was steering. Everyone in the boat is paid,
# pilot and gunner alike - Cooperative Mode is off, so the grant has to name them all.
execute if score #tsb bacaptmh_mp6 matches 2.. on vehicle if entity @s[type=#blazeandcave:all_boats] on passengers if entity @s[type=player,gamemode=!spectator] run advancement grant @s only bacaptmh:biomes/thar_she_blows
