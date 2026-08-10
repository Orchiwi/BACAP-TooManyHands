# Counter doorbell for the building_moss_and_vine ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_building_moss_and_vine 1
advancement revoke @s only bacaptmh:machinery/building_moss_and_vine_doorbell
