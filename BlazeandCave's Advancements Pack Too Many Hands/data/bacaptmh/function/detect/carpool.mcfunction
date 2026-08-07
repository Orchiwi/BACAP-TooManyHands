# Executed as a player who does not hold the advancement.
# Players are never written into a vehicle's Passengers NBT, so walk the passengers instead.
scoreboard players set #f3cpn bacaptmh_tmp 0
execute on vehicle if entity @s[type=#blazeandcave:all_boats] on passengers if entity @s[type=player,gamemode=!spectator] run scoreboard players add #f3cpn bacaptmh_tmp 1
execute if score #f3cpn bacaptmh_tmp matches 2.. on vehicle if entity @s[type=#blazeandcave:all_boats] on passengers if entity @s[type=player,gamemode=!spectator] run advancement grant @s only bacaptmh:animal/carpool
