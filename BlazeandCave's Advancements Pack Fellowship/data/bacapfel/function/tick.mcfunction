scoreboard players add #hb_tick bacapfel_sys 1
# Dispatch buckets. Every check inside them is gated on players who do not yet
# hold the advancement, and multiplayer checks exit early when too few are online.
scoreboard players add $t10 bacapfel_sys 1
scoreboard players add $t100 bacapfel_sys 1
function bacapfel:bucket_fast
execute if score $t10 bacapfel_sys matches 10.. run function bacapfel:bucket_medium
execute if score $t10 bacapfel_sys matches 10.. run scoreboard players set $t10 bacapfel_sys 0
execute if score $t100 bacapfel_sys matches 100.. run function bacapfel:bucket_slow
execute if score $t100 bacapfel_sys matches 100.. run scoreboard players set $t100 bacapfel_sys 0
