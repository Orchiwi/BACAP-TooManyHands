# Counter doorbell for the nether_gilded_split ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_nether_gilded_split 1
advancement revoke @s only bacaptmh:machinery/nether_gilded_split_doorbell
