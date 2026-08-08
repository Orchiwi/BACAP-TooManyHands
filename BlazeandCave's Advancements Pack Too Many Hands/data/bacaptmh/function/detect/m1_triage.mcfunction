# Executed as/at a player who threw a splash potion in the last two medium ticks and does not
# hold Triage. bacaptmh_m1hpd is this window's health change and bacaptmh_m1hpm is the health
# each player had BEFORE it - the mirror is advanced only after this function has run, and it
# is seeded before any detector runs, so a fresh login can never be read as a heal.
# The thrower is tagged out of the count, so this takes four players, not three.
tag @s add bacaptmh_m1medic
scoreboard players set #m1tn bacaptmh_sys 0
execute as @a[distance=..8,gamemode=!spectator,tag=!bacaptmh_m1medic,scores={bacaptmh_m1hpd=1..}] if score @s bacaptmh_m1hpm matches 1..5 run scoreboard players add #m1tn bacaptmh_sys 1
execute if score #m1tn bacaptmh_sys matches 3.. run advancement grant @s only bacaptmh:potion/triage
execute if score #m1tn bacaptmh_sys matches 3.. as @a[distance=..8,gamemode=!spectator,tag=!bacaptmh_m1medic,scores={bacaptmh_m1hpd=1..}] if score @s bacaptmh_m1hpm matches 1..5 run advancement grant @s only bacaptmh:potion/triage
tag @s remove bacaptmh_m1medic
