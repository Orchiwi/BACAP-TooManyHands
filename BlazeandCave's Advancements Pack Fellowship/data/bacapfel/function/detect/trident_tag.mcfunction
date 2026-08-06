# Trident Tag (A20). Both criteria are hooks: read them, then revoke them so they can
# fire again. Only players who do not hold the advancement are touched, so a revoke can
# never strip a finished advancement, and both hooks belong to the player being granted.
# The hit pass runs first, so a hit and a catch landing in the same cycle still pair up.
execute as @a[advancements={bacapfel:weaponry/trident_tag={hit_player=true}}] unless entity @s[advancements={bacapfel:weaponry/trident_tag=true}] run function bacapfel:detect/trident_hit
execute as @a[advancements={bacapfel:weaponry/trident_tag={caught=true}}] unless entity @s[advancements={bacapfel:weaponry/trident_tag=true}] run function bacapfel:detect/trident_catch
