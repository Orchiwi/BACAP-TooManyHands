# blazeandcave:is_flying is BACAP's own predicate for Elytra gliding (flags.is_flying).
tag @a remove bacapfel_fly
execute as @a[gamemode=!spectator] if predicate blazeandcave:is_flying store result score @s bacapfel_y run data get entity @s Pos[1] 1
execute as @a[gamemode=!spectator,scores={bacapfel_y=200..}] if predicate blazeandcave:is_flying run tag @s add bacapfel_fly

# Anyone not currently up there loses their hold.
scoreboard players set @a[tag=!bacapfel_fly] bacapfel_form 0

execute as @a[tag=bacapfel_fly] at @s run function bacapfel:detect/formation_flying_tick
tag @a remove bacapfel_fly
