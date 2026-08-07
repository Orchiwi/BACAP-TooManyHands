# Stamp the namer's id onto the animal he just named. The id is an integer this pack
# assigns in f2_init, never text a player controls, so there is nothing here to break out
# of - which is the whole reason this advancement no longer compares names.
scoreboard players operation #cuowner bacaptmh_sys = @s bacaptmh_pid
execute if score #cuowner bacaptmh_sys matches 1.. as @e[type=!minecraft:player,distance=..5,sort=nearest,limit=1] if data entity @s CustomName run scoreboard players operation @s bacaptmh_owner = #cuowner bacaptmh_sys
advancement revoke @s only bacaptmh:adventure/shared_custody named
