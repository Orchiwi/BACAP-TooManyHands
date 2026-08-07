# @s has just had Regeneration applied by another player (the 'dosed' criterion, whose
# source predicate pins entity_type player and distance min 1 - a self-splash measures the
# distance from an entity to itself, always 0, so it can never be self-served).
# requirements are [["dosed"],["impossible"]], so the flag alone never completes it.
advancement revoke @s only bacaptmh:potion/field_medic dosed

# Regeneration I heals no sooner than 50 ticks after it lands, so current health is
# still the health they had when the potion hit. Read at scale 10 and test 1..59, i.e.
# 0.1 to 5.9 HP: a quarter-heart rescue is admitted (scale 1 floored it to 0 and threw it
# out with the corpses), 6.0 HP - three hearts - is not, and a dead player's 0 is not.
scoreboard players set #hp bacaptmh_tmp4 0
execute store result score #hp bacaptmh_tmp4 run data get entity @s Health 10
execute if score #hp bacaptmh_tmp4 matches 1..59 run function bacaptmh:detect/field_medic_grant
