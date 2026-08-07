# Executed as/at a hostile monster near a player who is dealing damage right now.
# The 'softened' marker is an entity tag, so it disappears with the mob: no scoreboard row is
# ever written against a mob UUID and nothing can leak.
# Every member of the tag is a living entity, so Health is always present; the shared score is
# reset to an out-of-range sentinel first instead of probing with a second NBT access, which
# halves the cost of the walk while still being safe if a read ever returns nothing.
scoreboard players set #f3ashp bacaptmh_tmp 32767
execute store result score #f3ashp bacaptmh_tmp run data get entity @s Health 10
execute if score #f3ashp bacaptmh_tmp matches 1..39 run tag @s add bacaptmh_softened
execute if score #f3ashp bacaptmh_tmp matches ..0 if entity @s[tag=bacaptmh_softened] run function bacaptmh:detect/assist_grant
