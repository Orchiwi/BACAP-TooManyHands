# A11 Scale Model. Run at a player carrying a live Nether-meeting stamp.
# The stamp says only 'this player stood within five blocks of another player in the
# Nether some time in the last ten minutes'; the payout below is what makes it a pair.
execute unless dimension minecraft:overworld run return 0

# A distance argument makes the selector world-limited, so the far player is necessarily
# in the Overworld as well - the same property TMH long_distance_relationship relies on.
execute store result score #sm bacaptmh_m8 if entity @a[gamemode=!spectator,scores={bacaptmh_sm=1..},distance=800..]
execute if score #sm bacaptmh_m8 matches 1.. run advancement grant @s only bacaptmh:nether/scale_model
execute if score #sm bacaptmh_m8 matches 1.. run advancement grant @a[gamemode=!spectator,scores={bacaptmh_sm=1..},distance=800..] only bacaptmh:nether/scale_model
