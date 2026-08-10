# Counter doorbell for the nether_crying_obsidian_run ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_nether_crying_obsidian_run 1
advancement revoke @s only bacaptmh:machinery/nether_crying_obsidian_run_doorbell
