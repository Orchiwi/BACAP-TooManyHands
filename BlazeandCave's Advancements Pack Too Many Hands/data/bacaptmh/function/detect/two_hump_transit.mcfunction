# Executed as a player who does not hold the advancement.
scoreboard players set #f3thn bacaptmh_tmp 0
execute on vehicle if entity @s[type=camel] on passengers if entity @s[type=player,gamemode=!spectator] run scoreboard players add #f3thn bacaptmh_tmp 1
execute if score #f3thn bacaptmh_tmp matches 2.. on vehicle if entity @s[type=camel] on passengers if entity @s[type=player,gamemode=!spectator] run advancement grant @s only bacaptmh:animal/two_hump_transit
