# Counter doorbell for the animal_mounted_duel ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_animal_mounted_duel 1
advancement revoke @s only bacaptmh:machinery/animal_mounted_duel_doorbell
