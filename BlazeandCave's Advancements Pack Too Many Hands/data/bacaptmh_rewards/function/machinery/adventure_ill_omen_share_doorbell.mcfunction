# Counter doorbell for the adventure_ill_omen_share ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_adventure_ill_omen_share 1
advancement revoke @s only bacaptmh:machinery/adventure_ill_omen_share_doorbell
