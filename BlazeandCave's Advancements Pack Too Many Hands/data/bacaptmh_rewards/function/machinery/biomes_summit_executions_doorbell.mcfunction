# Counter doorbell for the biomes_summit_executions ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_biomes_summit_executions 1
advancement revoke @s only bacaptmh:machinery/biomes_summit_executions_doorbell
