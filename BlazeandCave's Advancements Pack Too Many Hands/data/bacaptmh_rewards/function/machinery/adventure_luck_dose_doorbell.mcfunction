# Counter doorbell for the adventure_luck_dose ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_adventure_luck_dose 1
advancement revoke @s only bacaptmh:machinery/adventure_luck_dose_doorbell
