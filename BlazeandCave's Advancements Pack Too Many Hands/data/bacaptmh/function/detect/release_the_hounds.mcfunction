# Run as the victim, at the death spot, in the same tick the death was processed.
# Vanilla credits a pet kill to the wolf, not to its owner, so the victim's own criterion
# is the only signal there is - the payout goes to the wolves' owners, never to the victim.
# The killer is resolved FROM the victim with `on attacker`, the way reservoir_dogs does it.
# Scanning for wolves near the death spot instead used to pay every bystander whose pets
# happened to be in the neighbourhood, for a kill their dogs took no part in.
advancement revoke @s only bacaptmh:animal/release_the_hounds
tag @s add bacaptmh_mauled
execute on attacker if entity @s[type=minecraft:wolf] on owner run function bacaptmh:detect/hounds_owner
tag @s remove bacaptmh_mauled
