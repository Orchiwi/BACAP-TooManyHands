# 24, not 50. Fifty blocks is a full-power beacon's own reach, so two beacons a hundred
# blocks apart could pool their crowds; 24 cannot span two beacons.
execute store result score #cb bacaptmh_tmp4 if entity @a[tag=bacaptmh_beacon,distance=..24]
execute if score #cb bacaptmh_tmp4 matches 4.. run advancement grant @a[tag=bacaptmh_beacon,distance=..24] only bacaptmh:building/community_beacon
