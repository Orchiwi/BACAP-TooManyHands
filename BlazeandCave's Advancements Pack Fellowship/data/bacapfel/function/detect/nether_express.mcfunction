# NOTE: the dimension mirror itself is NOT maintained here. It is an unconditional line in
# the medium bucket, because a mirror that only updates while this gate is open goes stale
# the moment the gate shuts and then arms every drifted player at once when it reopens.
# This half is only the co-location check.
execute as @a[gamemode=!spectator,scores={bacapfel_pt=1..}] at @s run function bacapfel:detect/nether_express_group
