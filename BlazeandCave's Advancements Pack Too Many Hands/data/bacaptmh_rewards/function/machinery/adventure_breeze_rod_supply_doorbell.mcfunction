# Counter doorbell for the adventure_breeze_rod_supply ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_adventure_breeze_rod_supply 1
advancement revoke @s only bacaptmh:machinery/adventure_breeze_rod_supply_doorbell
