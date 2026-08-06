tag @a remove bacapfel_cond
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:conduit_power"}]}] add bacapfel_cond
execute as @a[tag=bacapfel_cond] at @s run function bacapfel:detect/conduit_club_group
tag @a remove bacapfel_cond
