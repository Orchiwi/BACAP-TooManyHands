# @s just caught a Shulker Box thrown by ANOTHER player. Direction confirmed against
# BACAP husbandry/allay_deliver_item_to_player and adventure/awards_ceremony, which both
# use this trigger, award the RECEIVER, and describe 'this' in the entity predicate as the
# thrower. The self-hand-off hole is closed with BACAP's own guard from
# mining/diamonds_to_you: distance absolute min 1, which for one entity against itself is
# always 0 and therefore always rejected.
# requirements are [["hand_off"],["impossible"]] - every criterion named, still uncompletable.
advancement revoke @s only bacaptmh:challenges/the_gauntlet hand_off

# The relay has gone cold - start a fresh one
execute if score #timer bacaptmh_gaunt matches ..0 run function bacaptmh:detect/gauntlet_reset
scoreboard players set #timer bacaptmh_gaunt 36000

# A pair of hands we have not seen on this run
execute unless entity @s[tag=bacaptmh_gaunt] run function bacaptmh:detect/gauntlet_count

# Tick off the dimension this leg happened in
execute if dimension minecraft:overworld run scoreboard players set #dow bacaptmh_gaunt 1
execute if dimension minecraft:the_nether run scoreboard players set #dnether bacaptmh_gaunt 1
execute if dimension minecraft:the_end run scoreboard players set #dend bacaptmh_gaunt 1

execute if score #chain bacaptmh_gaunt matches 5.. if score #dow bacaptmh_gaunt matches 1 if score #dnether bacaptmh_gaunt matches 1 if score #dend bacaptmh_gaunt matches 1 run function bacaptmh:detect/gauntlet_grant
