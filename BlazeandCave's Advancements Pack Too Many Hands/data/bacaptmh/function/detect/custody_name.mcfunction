# Stamp the namer's id onto the animal he just named. The id is an integer this pack
# assigns in f2_init, never text a player controls, so there is nothing here to break out
# of - which is the whole reason this advancement no longer compares names.
# Selector arguments resolve BEFORE the trailing `if` clause, so `sort=nearest,limit=1`
# followed by `if data entity @s CustomName` picked whatever was closest - an item, an
# orb, an unnamed herd-mate - and then silently dropped the stamp. There is no selector
# form for "has a CustomName", so instead walk the candidates nearest-first and let the
# FIRST named one claim the stamp through a one-shot flag.
scoreboard players operation #cuowner bacaptmh_sys = @s bacaptmh_pid
scoreboard players set #cudone bacaptmh_sys 0
execute if score #cuowner bacaptmh_sys matches 1.. as @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:leash_knot,distance=..5,sort=nearest,limit=16] if score #cudone bacaptmh_sys matches 0 if data entity @s CustomName run function bacaptmh:detect/custody_stamp
advancement revoke @s only bacaptmh:adventure/shared_custody named
