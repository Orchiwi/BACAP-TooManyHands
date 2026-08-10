# Counter doorbell for the statistics_elytra_strafes ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_statistics_elytra_strafes 1
advancement revoke @s only bacaptmh:machinery/statistics_elytra_strafes_doorbell
