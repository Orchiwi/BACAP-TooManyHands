# Head of the Household. Run as - and at - a player who was just killed by a Charged
# Creeper's blast ('blown_up'; requirements are [[blown_up,took_the_head],[impossible]],
# so neither criterion can ever complete this on its own). He is still lying on the spot
# he died on when the fast bucket reaches him, so this runs in the crater, and the head
# he just dropped is on the floor in front of it.
# Everyone ELSE standing in the blast gets thirty seconds to pick that head up. The
# corpse is tagged out of his own selector rather than filtered with distance=1.., because
# a bystander can legitimately be standing right on top of the body - and because the one
# player who must never be able to cash this in is the victim himself.
tag @s add bacaptmh_hoh_body
scoreboard players set @a[tag=!bacaptmh_hoh_body,gamemode=!spectator,distance=..16] bacaptmh_hoh 600
tag @s remove bacaptmh_hoh_body
