# Counter doorbell for the redstone_egg_barrage ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_redstone_egg_barrage 1
advancement revoke @s only bacaptmh:machinery/redstone_egg_barrage_doorbell
