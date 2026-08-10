# Counter doorbell for the adventure_spyglass_watch ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_adventure_spyglass_watch 1
advancement revoke @s only bacaptmh:machinery/adventure_spyglass_watch_doorbell
