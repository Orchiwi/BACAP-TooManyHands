# blazeandcave:is_flying is BACAP's own predicate for Elytra gliding (flags.is_flying).
tag @a remove bacaptmh_fly
execute as @a[gamemode=!spectator] if predicate blazeandcave:is_flying store result score @s bacaptmh_y run data get entity @s Pos[1] 1
execute as @a[gamemode=!spectator,scores={bacaptmh_y=200..}] if predicate blazeandcave:is_flying run tag @s add bacaptmh_fly

# Anyone not currently up there loses their hold.
scoreboard players set @a[tag=!bacaptmh_fly] bacaptmh_form 0

execute as @a[tag=bacaptmh_fly] at @s run function bacaptmh:detect/formation_flying_tick
tag @a remove bacaptmh_fly
