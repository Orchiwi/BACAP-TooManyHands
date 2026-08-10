# Counter doorbell for the redstone_button_batch ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_redstone_button_batch 1
advancement revoke @s only bacaptmh:machinery/redstone_button_batch_doorbell
