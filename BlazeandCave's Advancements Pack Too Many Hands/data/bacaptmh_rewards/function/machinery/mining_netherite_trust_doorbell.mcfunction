# Counter doorbell for the mining_netherite_trust ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_mining_netherite_trust 1
advancement revoke @s only bacaptmh:machinery/mining_netherite_trust_doorbell
