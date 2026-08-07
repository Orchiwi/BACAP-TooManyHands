# Every per-player mirror and flag is seeded HERE, before any detector runs.
# These calls used to sit inside the dispatch buckets, which meant a detector
# could run first: on a player whose mirror was still unset,
# `unless score @s <stat> = @s <mirror>` is true, so the detector fired and read
# a whole lifetime statistic as one fresh event. Each line is self-gating, so
# this costs one failed score check per player per tick once seeded.
execute as @a[gamemode=!spectator] unless score @s bacaptmh_f2init matches 1 run function bacaptmh:detect/f2_init
execute as @a unless score @s bacaptmh_init matches 1 run function bacaptmh:detect/f4_init
