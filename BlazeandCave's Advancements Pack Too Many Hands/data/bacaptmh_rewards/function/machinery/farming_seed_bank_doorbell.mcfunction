# Counter doorbell for the farming_seed_bank ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_farming_seed_bank 1
advancement revoke @s only bacaptmh:machinery/farming_seed_bank_doorbell
