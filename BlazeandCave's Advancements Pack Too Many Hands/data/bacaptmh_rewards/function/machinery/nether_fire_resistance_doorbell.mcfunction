# Counter doorbell for the nether_fire_resistance ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_nether_fire_resistance 1
advancement revoke @s only bacaptmh:machinery/nether_fire_resistance_doorbell
