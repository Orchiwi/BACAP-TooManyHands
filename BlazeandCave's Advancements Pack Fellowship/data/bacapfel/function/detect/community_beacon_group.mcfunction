# 24, not 50. Fifty blocks is a full-power beacon's own reach, so two beacons a hundred
# blocks apart could pool their crowds; 24 cannot span two beacons.
execute store result score #cb bacapfel_tmp4 if entity @a[tag=bacapfel_beacon,distance=..24]
execute if score #cb bacapfel_tmp4 matches 4.. run advancement grant @a[tag=bacapfel_beacon,distance=..24] only bacapfel:building/community_beacon
