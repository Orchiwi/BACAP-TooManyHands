# Counter doorbell for the building_stair_carry ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_building_stair_carry 1
advancement revoke @s only bacaptmh:machinery/building_stair_carry_doorbell
