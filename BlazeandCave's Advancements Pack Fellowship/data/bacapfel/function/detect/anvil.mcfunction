# Falling Out (A21), dropper half and payout.
# placing an anvil arms the placer for ten seconds; the hook criterion is cleared again
# straight away, and only players who do not hold the advancement are ever touched
execute as @a[advancements={bacapfel:weaponry/falling_out={dropped=true}}] unless entity @s[advancements={bacapfel:weaponry/falling_out=true}] run function bacapfel:detect/anvil_armed
# a player stamped under a falling anvil whose death flag has just come up may pay out
execute as @a[scores={bacapfel_anvilv=1..,bacapfel_edeath=1..}] run function bacapfel:detect/anvil_death
# then clear the victim hooks again, so an anvil somebody survived cannot be paired with
# a later, unrelated death. Holders are skipped: every criterion of a finished
# advancement is true, and revoking one would strip the advancement off them.
execute as @a[advancements={bacapfel:weaponry/falling_out={crushed_anvil=true}}] unless entity @s[advancements={bacapfel:weaponry/falling_out=true}] run advancement revoke @s only bacapfel:weaponry/falling_out crushed_anvil
execute as @a[advancements={bacapfel:weaponry/falling_out={crushed_chipped=true}}] unless entity @s[advancements={bacapfel:weaponry/falling_out=true}] run advancement revoke @s only bacapfel:weaponry/falling_out crushed_chipped
execute as @a[advancements={bacapfel:weaponry/falling_out={crushed_damaged=true}}] unless entity @s[advancements={bacapfel:weaponry/falling_out=true}] run advancement revoke @s only bacapfel:weaponry/falling_out crushed_damaged
