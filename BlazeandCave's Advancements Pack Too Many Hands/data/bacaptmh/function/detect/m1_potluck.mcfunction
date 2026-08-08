# Executed as/at a player whose shared food window is live and who does not hold Potluck.
# Five DISTINCT food families and five DISTINCT eaters must be inside eight blocks. Every
# window is opened from an advancement criterion that is revoked again on the same bucket
# pass, so nothing here can read a lifetime eating statistic as a fresh meal.
scoreboard players set #m1pf bacaptmh_sys 0
execute if entity @a[distance=..8,gamemode=!spectator,scores={bacaptmh_m1p1=1..}] run scoreboard players add #m1pf bacaptmh_sys 1
execute if entity @a[distance=..8,gamemode=!spectator,scores={bacaptmh_m1p2=1..}] run scoreboard players add #m1pf bacaptmh_sys 1
execute if entity @a[distance=..8,gamemode=!spectator,scores={bacaptmh_m1p3=1..}] run scoreboard players add #m1pf bacaptmh_sys 1
execute if entity @a[distance=..8,gamemode=!spectator,scores={bacaptmh_m1p4=1..}] run scoreboard players add #m1pf bacaptmh_sys 1
execute if entity @a[distance=..8,gamemode=!spectator,scores={bacaptmh_m1p5=1..}] run scoreboard players add #m1pf bacaptmh_sys 1
execute unless score #m1pf bacaptmh_sys matches 5 run return 0
# Count the eaters properly. 'if entity @a[limit=5]' would only ever test for one match.
execute store result score #m1pn bacaptmh_sys run execute if entity @a[distance=..8,gamemode=!spectator,scores={bacaptmh_m1pa=1..}]
execute if score #m1pn bacaptmh_sys matches 5.. run advancement grant @a[distance=..8,gamemode=!spectator,scores={bacaptmh_m1pa=1..}] only bacaptmh:farming/potluck
