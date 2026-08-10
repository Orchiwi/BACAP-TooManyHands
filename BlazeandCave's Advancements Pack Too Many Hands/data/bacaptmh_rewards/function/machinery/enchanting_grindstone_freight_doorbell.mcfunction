# Counter doorbell for the enchanting_grindstone_freight ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_enchanting_grindstone_freight 1
advancement revoke @s only bacaptmh:machinery/enchanting_grindstone_freight_doorbell
