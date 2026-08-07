# A13 Raid Party - three players carrying Hero of the Village at the same moment.
# The effect is read live from NBT for everyone. The earlier version read it from a
# minecraft:location criterion for claimants, which vanilla fires only once per 20 ticks
# at each player's own tickCount phase; tagging from that and revoking in the same pass
# meant two players whose phases fell either side of the sampling pass were never flagged
# together. Reading NBT has no phase, and it keeps holders counting for everyone else.
execute store result score #n bacaptmh_n if entity @a[gamemode=!spectator]
execute if score #n bacaptmh_n matches ..2 run return 0
tag @a remove bacaptmh_hero
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:hero_of_the_village"}]}] add bacaptmh_hero
execute store result score #h bacaptmh_n if entity @a[tag=bacaptmh_hero]
execute if score #h bacaptmh_n matches 3.. run advancement grant @a[tag=bacaptmh_hero] only bacaptmh:adventure/raid_party
tag @a remove bacaptmh_hero
