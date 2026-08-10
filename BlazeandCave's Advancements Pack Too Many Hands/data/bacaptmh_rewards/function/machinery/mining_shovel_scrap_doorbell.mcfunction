# Counter doorbell for the mining_shovel_scrap ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_mining_shovel_scrap 1
advancement revoke @s only bacaptmh:machinery/mining_shovel_scrap_doorbell
