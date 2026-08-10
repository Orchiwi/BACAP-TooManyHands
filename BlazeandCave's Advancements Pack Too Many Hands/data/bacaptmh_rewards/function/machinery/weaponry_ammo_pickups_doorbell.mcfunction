# Counter doorbell for the weaponry_ammo_pickups ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_weaponry_ammo_pickups 1
advancement revoke @s only bacaptmh:machinery/weaponry_ammo_pickups_doorbell
