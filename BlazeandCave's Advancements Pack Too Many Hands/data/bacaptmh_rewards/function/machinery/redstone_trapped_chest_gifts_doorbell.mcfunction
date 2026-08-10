# Counter doorbell for the redstone_trapped_chest_gifts ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_redstone_trapped_chest_gifts 1
advancement revoke @s only bacaptmh:machinery/redstone_trapped_chest_gifts_doorbell
