# Executed as/at a non-spectator, non-creative player who is mounted on a Nautilus, submerged
# and inside an Ocean Monument (the 'inside' criterion, turned into a four-window bacaptmh_cst
# stamp by the bucket) and who does not yet hold the advancement.
# Alone in the monument the tally is wiped, so the forty blocks have to be swum as a pair.
execute unless entity @a[gamemode=!spectator,distance=1..16,scores={bacaptmh_cst=1..}] run scoreboard players set @s bacaptmh_cous 0
execute if entity @a[gamemode=!spectator,distance=1..16,scores={bacaptmh_cst=1..}] if score @s bacaptmh_nautd matches 1.. run scoreboard players operation @s bacaptmh_cous += @s bacaptmh_nautd
# 4000 cm is forty blocks. Both swimmers must be over the line, and both are granted.
execute if score @s bacaptmh_cous matches 4000.. if entity @a[gamemode=!spectator,distance=1..16,scores={bacaptmh_cous=4000..}] run advancement grant @a[gamemode=!spectator,distance=..16,scores={bacaptmh_cous=4000..}] only bacaptmh:biomes/the_cousteau_manoeuvre
