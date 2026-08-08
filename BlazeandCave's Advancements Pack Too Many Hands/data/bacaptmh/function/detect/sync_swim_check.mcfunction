# Executed as/at a player who was in the swimming pose during this window and does not yet
# hold the advancement. Swimmers are COUNTED into a score: 'if entity @a[limit=4]' only ever
# asks whether at least one player matches, so it would guard nothing. The bacaptmh_swimming
# tag is applied in bucket_medium to every eligible player regardless of advancement state,
# so somebody who already holds this can still make up the fourth swimmer, and everyone in
# the group is granted rather than only the player who tripped the check.
execute store result score #s13n bacaptmh_tmp run execute if entity @a[gamemode=!spectator,gamemode=!creative,tag=bacaptmh_swimming,distance=..6]
execute if score #s13n bacaptmh_tmp matches 4.. run advancement grant @a[gamemode=!spectator,gamemode=!creative,tag=bacaptmh_swimming,distance=..6] only bacaptmh:biomes/synchronised_swimming
