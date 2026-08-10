# Counter doorbell for the end_storage_convoy ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_end_storage_convoy 1
advancement revoke @s only bacaptmh:machinery/end_storage_convoy_doorbell
