# Counter doorbell for the redstone_dust_relay ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_redstone_dust_relay 1
advancement revoke @s only bacaptmh:machinery/redstone_dust_relay_doorbell
