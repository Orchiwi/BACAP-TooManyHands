# A1 Escort Mission. Run as a non-spectator, non-creative player who does not hold it
# yet, at @s, every medium tick. bacaptmh_walkd is this window's walk + sprint delta;
# it is rebuilt for EVERY player, ungated, at the top of bucket_medium, and both mirrors
# are seeded in seed_lines, so a player this gate has never touched can never have a
# lifetime statistic read as one window of travel.
execute unless items entity @s armor.head minecraft:carved_pumpkin run scoreboard players set @s bacaptmh_esc 0
execute unless items entity @s armor.head minecraft:carved_pumpkin run return 0

# A real head count. 'if entity @a[limit=2]' only ever tests for at least one match.
execute store result score #esc bacaptmh_m8 if entity @a[gamemode=!spectator,distance=..5]
execute if score #esc bacaptmh_m8 matches ..1 run scoreboard players set @s bacaptmh_esc 0
execute if score #esc bacaptmh_m8 matches ..1 run return 0

# 1..2000 cm in half a second: positive, and still physically possible on foot even with
# Speed and Soul Speed. A stale mirror left by a gamemode round trip lands outside the
# band and is discarded rather than credited.
execute if score @s bacaptmh_walkd matches 1..2000 run scoreboard players operation @s bacaptmh_esc += @s bacaptmh_walkd
execute if score @s bacaptmh_esc matches 20000.. run advancement grant @a[gamemode=!spectator,distance=..5] only bacaptmh:adventure/escort_mission
