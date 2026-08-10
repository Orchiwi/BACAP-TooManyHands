# Counter doorbell for the adventure_trial_key_handover ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_adventure_trial_key_handover 1
advancement revoke @s only bacaptmh:machinery/adventure_trial_key_handover_doorbell
