# Group Therapy - three players, each on three hearts or less, eat a Golden Apple inside
# three seconds of one another.
#
# The health test is deliberately NOT taken here. A Golden Apple grants Absorption the
# instant it is swallowed and the vanilla 'health' criterion counts absorption, so reading
# health after the fact would show the eater back above three hearts. Instead an ungated
# bucket_medium line stamps bacaptmh_glow=4 on anyone currently at 5 health or less, and
# this function only asks whether that stamp is still alive.
#
# The used:golden_apple mirror, the low-health stamp and both countdowns are refreshed by
# UNGATED lines in bucket_medium that run whether or not this function did, and the mirror
# is also seeded in seed.mcfunction, so a lifetime apple total can never be read as a fresh
# event and no window can freeze while the gate is shut.
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_glow=1..}] if score @s bacaptmh_gapple > @s bacaptmh_gapple_m run scoreboard players set @s bacaptmh_gt 6
# Count the live windows - counted, never tested with a limit= selector.
scoreboard players set #gt bacaptmh_ap 0
execute as @a[gamemode=!spectator,scores={bacaptmh_gt=1..}] run scoreboard players add #gt bacaptmh_ap 1
# Grant to EVERY participant, not just the last one to bite. Counting is never gated on who
# already holds the advancement, so a veteran still counts and cannot lock anybody out.
execute if score #gt bacaptmh_ap matches 3.. run advancement grant @a[gamemode=!spectator,scores={bacaptmh_gt=1..}] only bacaptmh:farming/group_therapy
