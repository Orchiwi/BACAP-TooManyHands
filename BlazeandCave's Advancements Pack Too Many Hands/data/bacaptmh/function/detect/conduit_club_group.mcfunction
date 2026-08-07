# A full-power conduit reaches 96 blocks, so a 48-block cluster is one conduit's crowd.
execute store result score #cc bacaptmh_tmp4 if entity @a[tag=bacaptmh_cond,distance=..48]
execute if score #cc bacaptmh_tmp4 matches 3.. run advancement grant @a[tag=bacaptmh_cond,distance=..48] only bacaptmh:biomes/conduit_club
