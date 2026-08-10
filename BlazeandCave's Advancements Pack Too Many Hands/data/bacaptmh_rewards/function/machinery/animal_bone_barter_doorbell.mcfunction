# Counter doorbell for the animal_bone_barter ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_animal_bone_barter 1
advancement revoke @s only bacaptmh:machinery/animal_bone_barter_doorbell
