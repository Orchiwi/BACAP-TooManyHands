# Arrivals only land this close together if it was the same portal.
execute store result score #ne bacapfel_tmp4 if entity @a[gamemode=!spectator,scores={bacapfel_pt=1..},distance=..24]
execute if score #ne bacapfel_tmp4 matches 4.. run function bacapfel:detect/nether_express_grant
