# Counter doorbell for the adventure_lantern_convoy ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_adventure_lantern_convoy 1
advancement revoke @s only bacaptmh:machinery/adventure_lantern_convoy_doorbell
