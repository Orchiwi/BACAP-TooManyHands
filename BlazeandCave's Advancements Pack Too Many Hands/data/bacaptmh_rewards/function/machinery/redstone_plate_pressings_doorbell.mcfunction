# Counter doorbell for the redstone_plate_pressings ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_redstone_plate_pressings 1
advancement revoke @s only bacaptmh:machinery/redstone_plate_pressings_doorbell
