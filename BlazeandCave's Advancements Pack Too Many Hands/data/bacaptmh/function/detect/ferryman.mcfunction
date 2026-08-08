# Executed as/at a non-spectator in the End who does not yet hold the advancement.
# Players are never written into a vehicle's Passengers NBT, so the passenger list is
# walked with 'on passengers', exactly as detect/carpool does.
scoreboard players set #fry bacaptmh_tmp4 0
execute on vehicle if entity @s[type=happy_ghast] on passengers if entity @s[type=player,gamemode=!spectator] run scoreboard players add #fry bacaptmh_tmp4 1
# Solo, or the passenger got off: the run is void and starts again from the middle.
execute if score #fry bacaptmh_tmp4 matches ..1 run scoreboard players set @s bacaptmh_ferry 0
execute if score #fry bacaptmh_tmp4 matches ..1 run return 0
# Leg 1: over the central island. Box selectors are absolute world coordinates and are
# limited to the execution dimension, which 'at @s' has already pinned to the End.
execute if entity @s[x=-96,y=-320,z=-96,dx=192,dy=1024,dz=192] run scoreboard players set @s bacaptmh_ferry 1
# Leg 2: the open void between 600 and 900 blocks out. An End Gateway drops a player from
# the middle straight to roughly a thousand blocks out, so it can never touch this band -
# that is precisely what makes the Gateway route unrewardable.
execute if score @s bacaptmh_ferry matches 1 unless entity @s[x=-600,y=-320,z=-600,dx=1200,dy=1024,dz=1200] if entity @s[x=-900,y=-320,z=-900,dx=1800,dy=1024,dz=1800] run scoreboard players set @s bacaptmh_ferry 2
# Arrival: past a thousand blocks with both legs flown. Everyone aboard is credited.
execute if score @s bacaptmh_ferry matches 2 unless entity @s[x=-1000,y=-320,z=-1000,dx=2000,dy=1024,dz=2000] on vehicle on passengers run advancement grant @s[type=player,gamemode=!spectator] only bacaptmh:end/the_ferryman_cometh
