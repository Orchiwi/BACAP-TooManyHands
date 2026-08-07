# The medic is a DIFFERENT player within 16 blocks who threw a splash potion recently.
# Two ways to qualify, and both are needed: a potion thrown at an ally a few blocks away
# lands its effect 2-6 ticks after minecraft.used:minecraft.splash_potion rises, which is
# usually before the next medium tick turns that rise into a bacaptmh_medic window. So
# accept either an open window OR a splash delta still pending against its own mirror.
# Between them they cover the whole interval from the throw to window expiry with no gap.
tag @s add bacaptmh_patient
execute as @a[gamemode=!spectator,tag=!bacaptmh_patient,distance=..16,scores={bacaptmh_medic=1..}] run tag @s add bacaptmh_medicc
execute as @a[gamemode=!spectator,tag=!bacaptmh_patient,distance=..16] if score @s bacaptmh_splash > @s bacaptmh_splash_m run tag @s add bacaptmh_medicc
execute if entity @a[tag=bacaptmh_medicc,limit=1] run advancement grant @s only bacaptmh:potion/field_medic
execute if entity @a[tag=bacaptmh_medicc,limit=1] run advancement grant @a[tag=bacaptmh_medicc] only bacaptmh:potion/field_medic
tag @a remove bacaptmh_medicc
tag @s remove bacaptmh_patient
