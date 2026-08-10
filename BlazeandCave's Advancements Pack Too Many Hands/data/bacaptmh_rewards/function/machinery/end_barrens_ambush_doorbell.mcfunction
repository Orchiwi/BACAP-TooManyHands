# Counter doorbell for the end_barrens_ambush ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_end_barrens_ambush 1
advancement revoke @s only bacaptmh:machinery/end_barrens_ambush_doorbell
