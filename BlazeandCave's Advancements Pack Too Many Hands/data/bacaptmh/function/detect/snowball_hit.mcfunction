# run as the thrower, positioned at his snowball. Because the tick function runs before
# entities move, the last sample of a snowball is up to one tick of travel short of the
# player it is about to hit, which is what the 1.6 block radius is for.
# The owner tag makes it impossible for the thrower to be one of his own victims.
tag @s add bacaptmh_sb_owner
execute as @a[tag=!bacaptmh_sb_owner,distance=..1.6,gamemode=!spectator] run function bacaptmh:detect/snowball_victim
tag @s remove bacaptmh_sb_owner
