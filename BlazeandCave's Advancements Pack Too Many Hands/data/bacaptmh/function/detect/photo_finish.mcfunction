# Photo Finish. Executed as/at a survival player whose minecraft.custom:minecraft.horse_one_cm
# rose by at least 500 cm in this 10-tick window - five blocks in half a second, ten blocks a
# second, which only a fast horse sustains. The delta is computed for EVERY non-spectator in
# bucket_medium against a private mirror seeded in bacaptmh:seed, so a lifetime total can never
# be read as a fresh event and no other advancement consumes it.
# distance=0.5..3 excludes @s himself: an entity measured from its own position is at exactly 0.
execute if entity @a[gamemode=!spectator,gamemode=!creative,distance=0.5..3,scores={bacaptmh_hcmd=500..}] run advancement grant @a[gamemode=!spectator,gamemode=!creative,distance=..3,scores={bacaptmh_hcmd=500..}] only bacaptmh:animal/photo_finish
