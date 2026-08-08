# Runs as the far player. #ax/#az hold the near player's coordinates.
# Mirrored means x1 + x2 == 0 and z1 + z2 == 0. The 3-block tolerance absorbs the
# truncation in 'data get ... 1' on each of the two readings plus a block of slack for
# standing on the mark rather than exactly on it.
execute store result score #sx bacaptmh_ap run data get entity @s Pos[0] 1
execute store result score #sz bacaptmh_ap run data get entity @s Pos[2] 1
scoreboard players operation #sx bacaptmh_ap += #ax bacaptmh_ap
scoreboard players operation #sz bacaptmh_ap += #az bacaptmh_ap
# Both halves of the pair are granted - Cooperative Mode is off, so the partner who is not
# @s would otherwise walk away with nothing.
execute if score #sx bacaptmh_ap matches -3..3 if score #sz bacaptmh_ap matches -3..3 run advancement grant @s only bacaptmh:statistics/antipodes
execute if score #sx bacaptmh_ap matches -3..3 if score #sz bacaptmh_ap matches -3..3 run advancement grant @a[tag=bacaptmh_anti,limit=1] only bacaptmh:statistics/antipodes
