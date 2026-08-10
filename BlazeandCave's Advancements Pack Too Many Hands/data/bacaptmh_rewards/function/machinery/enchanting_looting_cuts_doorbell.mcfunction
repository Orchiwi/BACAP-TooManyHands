# Counter doorbell for the enchanting_looting_cuts ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_enchanting_looting_cuts 1
advancement revoke @s only bacaptmh:machinery/enchanting_looting_cuts_doorbell
