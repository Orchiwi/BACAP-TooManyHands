# Counter doorbell for the biomes_flower_bouquet ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_biomes_flower_bouquet 1
advancement revoke @s only bacaptmh:machinery/biomes_flower_bouquet_doorbell
