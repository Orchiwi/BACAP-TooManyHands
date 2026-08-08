# Falling Out (A21), dropper half and payout.
# placing an anvil arms the placer for ten seconds; the hook criterion is cleared again
# straight away, and only players who do not hold the advancement are ever touched
execute as @a[advancements={bacaptmh:weaponry/falling_out={dropped=true}}] unless entity @s[advancements={bacaptmh:weaponry/falling_out=true}] run function bacaptmh:detect/anvil_armed
# a player stamped under a falling anvil whose death flag has just come up may pay out
execute as @a[scores={bacaptmh_anvilv=1..,bacaptmh_edeath=1..}] run function bacaptmh:detect/anvil_death
# then clear the victim hooks again, so an anvil somebody survived cannot be paired with
# a later, unrelated death. The victim_ prefix is a reminder that these three fire for the
# player the anvil landed ON, never for the dropper - the dropper's own half is 'dropped',
# and the pairing of the two is done in detect/anvil_pay. Holders are skipped: every
# criterion of a finished advancement is true, and revoking one would strip it off them.
execute as @a[advancements={bacaptmh:weaponry/falling_out={victim_crushed_anvil=true}}] unless entity @s[advancements={bacaptmh:weaponry/falling_out=true}] run advancement revoke @s only bacaptmh:weaponry/falling_out victim_crushed_anvil
execute as @a[advancements={bacaptmh:weaponry/falling_out={victim_crushed_chipped=true}}] unless entity @s[advancements={bacaptmh:weaponry/falling_out=true}] run advancement revoke @s only bacaptmh:weaponry/falling_out victim_crushed_chipped
execute as @a[advancements={bacaptmh:weaponry/falling_out={victim_crushed_damaged=true}}] unless entity @s[advancements={bacaptmh:weaponry/falling_out=true}] run advancement revoke @s only bacaptmh:weaponry/falling_out victim_crushed_damaged
