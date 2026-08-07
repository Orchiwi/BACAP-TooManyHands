tag @a remove bacaptmh_cond
tag @a[gamemode=!spectator,nbt={active_effects:[{id:"minecraft:conduit_power"}]}] add bacaptmh_cond
execute as @a[tag=bacaptmh_cond] at @s run function bacaptmh:detect/conduit_club_group
tag @a remove bacaptmh_cond
