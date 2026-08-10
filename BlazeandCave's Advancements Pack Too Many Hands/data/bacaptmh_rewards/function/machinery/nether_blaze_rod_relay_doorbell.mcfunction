# Counter doorbell for the nether_blaze_rod_relay ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_nether_blaze_rod_relay 1
advancement revoke @s only bacaptmh:machinery/nether_blaze_rod_relay_doorbell
