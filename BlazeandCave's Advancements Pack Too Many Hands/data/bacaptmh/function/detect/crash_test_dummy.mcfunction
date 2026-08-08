# Executed as a player whose 'hurt' criterion is armed: within the last window another player
# hurt them. The criterion's source_entity predicate pins entity_type player and distance min 1,
# so a player's own arrow falling back onto them has distance 0 and cannot arm it.
# The flag is released first, so the next player hit re-arms it.
advancement revoke @s only bacaptmh:statistics/crash_test_dummy hurt
# bacaptmh_dtkd is this window's damage_taken delta, recomputed ungated for everyone in the
# bucket before this runs, so a quiet hour of mob damage can never be banked and then dumped
# into the tally by a single punch. The damage statistic counts ten units per damage point,
# so 5000 units is the five hundred points the advancement asks for.
execute if score @s bacaptmh_dtkd matches 1.. run scoreboard players operation @s bacaptmh_ptd += @s bacaptmh_dtkd
execute if score @s bacaptmh_ptd matches 5000.. run advancement grant @s only bacaptmh:statistics/crash_test_dummy
