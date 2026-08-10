# Counter doorbell for the potion_second_transfusion ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_potion_second_transfusion 1
advancement revoke @s only bacaptmh:machinery/potion_second_transfusion_doorbell
