# @s just caught a Shulker Box thrown by ANOTHER player. Direction confirmed against
# BACAP husbandry/allay_deliver_item_to_player and adventure/awards_ceremony, which both
# use this trigger, award the RECEIVER, and describe 'this' in the entity predicate as the
# thrower. The self-hand-off hole is closed with BACAP's own guard from
# mining/diamonds_to_you: distance absolute min 1, which for one entity against itself is
# always 0 and therefore always rejected.
# requirements are [["hand_off"],["impossible"]] - every criterion named, still uncompletable.
advancement revoke @s only bacapfel:challenges/the_gauntlet hand_off

# The relay has gone cold - start a fresh one
execute if score #timer bacapfel_gaunt matches ..0 run function bacapfel:detect/gauntlet_reset
scoreboard players set #timer bacapfel_gaunt 36000

# A pair of hands we have not seen on this run
execute unless entity @s[tag=bacapfel_gaunt] run function bacapfel:detect/gauntlet_count

# Tick off the dimension this leg happened in
execute if dimension minecraft:overworld run scoreboard players set #dow bacapfel_gaunt 1
execute if dimension minecraft:the_nether run scoreboard players set #dnether bacapfel_gaunt 1
execute if dimension minecraft:the_end run scoreboard players set #dend bacapfel_gaunt 1

execute if score #chain bacapfel_gaunt matches 5.. if score #dow bacapfel_gaunt matches 1 if score #dnether bacapfel_gaunt matches 1 if score #dend bacapfel_gaunt matches 1 run function bacapfel:detect/gauntlet_grant
