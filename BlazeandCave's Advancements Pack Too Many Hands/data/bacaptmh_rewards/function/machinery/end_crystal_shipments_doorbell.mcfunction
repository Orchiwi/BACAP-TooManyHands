# Counter doorbell for the end_crystal_shipments ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_end_crystal_shipments 1
advancement revoke @s only bacaptmh:machinery/end_crystal_shipments_doorbell
