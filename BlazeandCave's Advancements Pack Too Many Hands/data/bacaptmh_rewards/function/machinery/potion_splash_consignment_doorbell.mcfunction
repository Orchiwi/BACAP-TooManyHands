# Counter doorbell for the potion_splash_consignment ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_potion_splash_consignment 1
advancement revoke @s only bacaptmh:machinery/potion_splash_consignment_doorbell
