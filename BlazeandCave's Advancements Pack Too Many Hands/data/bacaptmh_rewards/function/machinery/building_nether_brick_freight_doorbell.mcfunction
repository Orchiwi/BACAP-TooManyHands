# Counter doorbell for the building_nether_brick_freight ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_building_nether_brick_freight 1
advancement revoke @s only bacaptmh:machinery/building_nether_brick_freight_doorbell
