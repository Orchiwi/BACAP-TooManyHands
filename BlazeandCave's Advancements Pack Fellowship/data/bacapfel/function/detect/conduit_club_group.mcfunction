# A full-power conduit reaches 96 blocks, so a 48-block cluster is one conduit's crowd.
execute store result score #cc bacapfel_tmp4 if entity @a[tag=bacapfel_cond,distance=..48]
execute if score #cc bacapfel_tmp4 matches 3.. run advancement grant @a[tag=bacapfel_cond,distance=..48] only bacapfel:biomes/conduit_club
