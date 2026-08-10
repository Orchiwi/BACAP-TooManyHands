# Counter doorbell for the mining_lava_insurance ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_mining_lava_insurance 1
advancement revoke @s only bacaptmh:machinery/mining_lava_insurance_doorbell
