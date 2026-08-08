# Antipodes - two players on mirrored coordinates, at least 3000 blocks from 0,0.
# Runs as, and at, a player who does not hold it yet.
#
# Mirroring about the origin at radius r puts the pair exactly 2r apart, so the 6000-block
# selector range below IS the 3000-block radius test - no square roots needed. distance=
# also confines the match to the executing dimension, so a pair split across the Nether
# can never qualify. The tag carries this player's identity into the pair function so the
# payout can name both halves instead of being broadcast.
tag @s add bacaptmh_anti
execute store result score #ax bacaptmh_ap run data get entity @s Pos[0] 1
execute store result score #az bacaptmh_ap run data get entity @s Pos[2] 1
execute as @a[gamemode=!spectator,distance=6000..] run function bacaptmh:detect/antipodes_pair
tag @s remove bacaptmh_anti
