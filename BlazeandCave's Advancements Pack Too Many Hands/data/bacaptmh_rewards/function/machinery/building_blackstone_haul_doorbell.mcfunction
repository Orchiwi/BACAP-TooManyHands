# Counter doorbell for the building_blackstone_haul ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_building_blackstone_haul 1
advancement revoke @s only bacaptmh:machinery/building_blackstone_haul_doorbell
