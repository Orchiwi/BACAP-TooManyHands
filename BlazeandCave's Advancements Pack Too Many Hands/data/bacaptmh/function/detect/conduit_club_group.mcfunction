# Conduit Power reaches up to 96 blocks, so the effect alone says nothing about WHICH
# conduit a player is standing under - a 48-block ball happily counted two crews at two
# different conduits as one club. There is no cheap way to read the conduit block off a
# player, so the group is keyed on the crowd instead: all three holders inside one
# 8-block ball centred on a holder, which is a huddle at one conduit and not a reef.
execute store result score #cc bacaptmh_tmp4 if entity @a[tag=bacaptmh_cond,distance=..8]
execute if score #cc bacaptmh_tmp4 matches 3.. run advancement grant @a[tag=bacaptmh_cond,distance=..8] only bacaptmh:biomes/conduit_club
