# Executed as/at a non-spectator, non-creative player who does not hold the advancement, only
# when four or more players are online.
# Distinct CARTS are counted, exactly as Convoy does, so four riders stacked in one minecart
# can never pass for four lines meeting. bacaptmh_cartd is the minecart_one_cm delta produced
# by detect/sample, which runs ungated and seeds its baseline on first sight, so a parked cart
# does not qualify. bacaptmh_rail is a deliberate lifetime total of plain Rails placed.
tag @e[type=minecart,distance=..16] remove bacaptmh_gc
execute as @a[gamemode=!spectator,gamemode=!creative,distance=..16,scores={bacaptmh_rail=200..,bacaptmh_cartd=1..}] on vehicle if entity @s[type=minecart,distance=..16] run tag @s add bacaptmh_gc
execute store result score #gcn bacaptmh_tmp run execute if entity @e[type=minecart,tag=bacaptmh_gc,distance=..16]
execute if score #gcn bacaptmh_tmp matches 4.. as @e[type=minecart,tag=bacaptmh_gc,distance=..16] on passengers if entity @s[type=player,gamemode=!spectator,gamemode=!creative] run advancement grant @s only bacaptmh:redstone/grand_central
tag @e[type=minecart,distance=..16] remove bacaptmh_gc
