# Counter doorbell for the redstone_lever_lending ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_redstone_lever_lending 1
advancement revoke @s only bacaptmh:machinery/redstone_lever_lending_doorbell
