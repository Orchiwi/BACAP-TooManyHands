# Counter doorbell for the farming_bone_meal_bag ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_farming_bone_meal_bag 1
advancement revoke @s only bacaptmh:machinery/farming_bone_meal_bag_doorbell
