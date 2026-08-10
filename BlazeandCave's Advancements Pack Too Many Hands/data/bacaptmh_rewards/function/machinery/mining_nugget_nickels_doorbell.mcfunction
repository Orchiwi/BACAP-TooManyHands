# Counter doorbell for the mining_nugget_nickels ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_mining_nugget_nickels 1
advancement revoke @s only bacaptmh:machinery/mining_nugget_nickels_doorbell
