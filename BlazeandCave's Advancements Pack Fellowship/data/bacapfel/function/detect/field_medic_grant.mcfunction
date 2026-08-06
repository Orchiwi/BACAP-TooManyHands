# The medic is a DIFFERENT player within 16 blocks who threw a splash potion recently.
# Two ways to qualify, and both are needed: a potion thrown at an ally a few blocks away
# lands its effect 2-6 ticks after minecraft.used:minecraft.splash_potion rises, which is
# usually before the next medium tick turns that rise into a bacapfel_medic window. So
# accept either an open window OR a splash delta still pending against its own mirror.
# Between them they cover the whole interval from the throw to window expiry with no gap.
tag @s add bacapfel_patient
execute as @a[gamemode=!spectator,tag=!bacapfel_patient,distance=..16,scores={bacapfel_medic=1..}] run tag @s add bacapfel_medicc
execute as @a[gamemode=!spectator,tag=!bacapfel_patient,distance=..16] if score @s bacapfel_splash > @s bacapfel_splash_m run tag @s add bacapfel_medicc
execute if entity @a[tag=bacapfel_medicc,limit=1] run advancement grant @s only bacapfel:potion/field_medic
execute if entity @a[tag=bacapfel_medicc,limit=1] run advancement grant @a[tag=bacapfel_medicc] only bacapfel:potion/field_medic
tag @a remove bacapfel_medicc
tag @s remove bacapfel_patient
