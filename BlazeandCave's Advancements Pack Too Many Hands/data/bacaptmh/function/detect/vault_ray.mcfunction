# Short line-of-sight walk to the vault the key was just used on: twelve 0.4-block steps,
# a little under five blocks, which is the reach the interaction happened at. The anchor
# is reset to feet after the first hop so the local offsets step forward instead of
# climbing to eye height again on every recursion.
execute if block ~ ~ ~ minecraft:vault[ominous=true] run function bacaptmh:detect/vault_read
execute if block ~ ~ ~ minecraft:vault[ominous=true] run return 0
scoreboard players add #ray bacaptmh_n 1
execute if score #ray bacaptmh_n matches ..11 positioned ^ ^ ^0.4 run function bacaptmh:detect/vault_ray
