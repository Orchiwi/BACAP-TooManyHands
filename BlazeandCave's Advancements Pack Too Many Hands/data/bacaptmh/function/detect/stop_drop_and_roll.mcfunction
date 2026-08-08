# Called unconditionally from bucket_medium: the two mirrors below must never freeze, or a
# stale fire sample would read as an extinguish the moment a second player logged in.
# Grants run first, on the samples taken at the end of the previous window.
# A player who still had 20+ fire ticks left last sample and is not burning now had the
# fire CUT SHORT - natural burn-down can only shed ten ticks between two samples ten ticks
# apart, so this cannot be a burnout. distance=1..8, never 0..8, so a self-splash pays
# nobody: player_hurt-style triggers and proximity checks alike have no self-exclusion.
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,scores={bacaptmh_firep=20..,bacaptmh_fire=..0}] at @s run advancement grant @a[gamemode=!spectator,distance=1..8,scores={bacaptmh_sdrt=1..}] only bacaptmh:potion/stop_drop_and_roll
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,scores={bacaptmh_firep=20..,bacaptmh_fire=..0}] at @s if entity @a[gamemode=!spectator,distance=1..8,scores={bacaptmh_sdrt=1..},limit=1] run advancement grant @s only bacaptmh:potion/stop_drop_and_roll
# Roll the fire sample forward, then take a fresh one.
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_firep = @s bacaptmh_fire
execute as @a[gamemode=!spectator] store result score @s bacaptmh_fire run data get entity @s Fire
# Splash-potion window, on a private mirror so it shares no delta with Field Medic or
# Chemical Warfare, both of which read the same bacaptmh_splash statistic.
scoreboard players remove @a[scores={bacaptmh_sdrt=1..}] bacaptmh_sdrt 1
execute as @a[gamemode=!spectator] if score @s bacaptmh_splash > @s bacaptmh_sdrm run scoreboard players set @s bacaptmh_sdrt 3
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_sdrm = @s bacaptmh_splash
