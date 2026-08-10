# Counter doorbell for the animal_rancher_hide ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_animal_rancher_hide 1
advancement revoke @s only bacaptmh:machinery/animal_rancher_hide_doorbell
