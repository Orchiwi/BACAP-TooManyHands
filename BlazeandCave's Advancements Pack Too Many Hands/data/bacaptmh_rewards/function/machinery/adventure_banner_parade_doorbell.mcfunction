# Counter doorbell for the adventure_banner_parade ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_adventure_banner_parade 1
advancement revoke @s only bacaptmh:machinery/adventure_banner_parade_doorbell
