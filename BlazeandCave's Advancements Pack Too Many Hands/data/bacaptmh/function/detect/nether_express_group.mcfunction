# Arrivals only land this close together if it was the same portal.
execute store result score #ne bacaptmh_tmp4 if entity @a[gamemode=!spectator,scores={bacaptmh_pt=1..},distance=..24]
execute if score #ne bacaptmh_tmp4 matches 4.. run function bacaptmh:detect/nether_express_grant
