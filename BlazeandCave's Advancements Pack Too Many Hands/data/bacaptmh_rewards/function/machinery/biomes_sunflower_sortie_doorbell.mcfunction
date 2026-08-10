# Counter doorbell for the biomes_sunflower_sortie ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_biomes_sunflower_sortie 1
advancement revoke @s only bacaptmh:machinery/biomes_sunflower_sortie_doorbell
