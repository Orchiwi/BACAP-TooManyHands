# Counter doorbell for the farming_cactus_shove ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_farming_cactus_shove 1
advancement revoke @s only bacaptmh:machinery/farming_cactus_shove_doorbell
