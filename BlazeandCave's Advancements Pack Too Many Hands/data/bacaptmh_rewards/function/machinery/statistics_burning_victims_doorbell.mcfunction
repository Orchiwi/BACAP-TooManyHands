# Counter doorbell for the statistics_burning_victims ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_statistics_burning_victims 1
advancement revoke @s only bacaptmh:machinery/statistics_burning_victims_doorbell
