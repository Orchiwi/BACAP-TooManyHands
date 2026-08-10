# Counter doorbell for the end_shell_consignments ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_end_shell_consignments 1
advancement revoke @s only bacaptmh:machinery/end_shell_consignments_doorbell
