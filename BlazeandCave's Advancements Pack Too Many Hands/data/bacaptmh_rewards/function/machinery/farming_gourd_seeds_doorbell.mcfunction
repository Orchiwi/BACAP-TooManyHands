# Counter doorbell for the farming_gourd_seeds ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_farming_gourd_seeds 1
advancement revoke @s only bacaptmh:machinery/farming_gourd_seeds_doorbell
