# Counter doorbell for the end_skyfall_hits ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_end_skyfall_hits 1
advancement revoke @s only bacaptmh:machinery/end_skyfall_hits_doorbell
