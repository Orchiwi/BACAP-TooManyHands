# @s died inside the last twenty seconds (bacaptmh_bb window, opened off a private
# deathCount objective), is off the death screen again, and is standing in the Nether.
# The dimension alone is only a proxy: with doImmediateRespawn on, or with a portal a
# short run from the death site, four world-spawn respawns fit it with no anchor in the
# world at all. So the headcount is taken first - it is cheap and it is what gates the
# rare case - and only then is the block sweep for the anchor itself paid for.
scoreboard players set #bb bacaptmh_mp6 0
execute store result score #bb bacaptmh_mp6 if entity @a[gamemode=!spectator,distance=..8,scores={bacaptmh_bb=1..},nbt=!{Health:0.0f}]
# Everyone who came back with him is granted, not only whoever tripped the check.
execute if score #bb bacaptmh_mp6 matches 4.. run function bacaptmh:detect/blood_brothers_anchor
