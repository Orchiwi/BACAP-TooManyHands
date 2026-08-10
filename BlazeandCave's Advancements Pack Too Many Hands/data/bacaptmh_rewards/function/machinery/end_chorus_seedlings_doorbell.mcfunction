# Counter doorbell for the end_chorus_seedlings ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_end_chorus_seedlings 1
advancement revoke @s only bacaptmh:machinery/end_chorus_seedlings_doorbell
