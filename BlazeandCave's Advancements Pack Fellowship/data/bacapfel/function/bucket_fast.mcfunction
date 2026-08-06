scoreboard players add #hb_fast bacapfel_sys 1
execute as @a[gamemode=!spectator,advancements={bacapfel:potion/field_medic={dosed=true,impossible=false}}] at @s run function bacapfel:detect/field_medic
execute as @a[gamemode=!spectator,advancements={bacapfel:potion/chemical_warfare={gassed=true,impossible=false}}] at @s run function bacapfel:detect/chemical_warfare
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacapfel:building/barn_raising={place=true,impossible=false}}] at @s run function bacapfel:detect/barn_raising
execute as @a[gamemode=!spectator,advancements={bacapfel:challenges/the_gauntlet={hand_off=true,impossible=false}}] at @s run function bacapfel:detect/gauntlet
execute if entity @a[gamemode=!spectator,scores={bacapfel_wt=1..},limit=1] as @a[gamemode=!spectator,gamemode=!creative] if predicate blazeandcave:is_on_ground run scoreboard players set @s bacapfel_fall 0
execute if entity @a[gamemode=!spectator,scores={bacapfel_wt=1..},limit=1] as @a[gamemode=!spectator,gamemode=!creative] at @s unless predicate blazeandcave:is_on_ground run function bacapfel:detect/trust_fall
execute if score #f2players bacapfel_sys matches 2.. as @a[gamemode=!spectator] at @s run function bacapfel:detect/f2_near
execute if entity @a[scores={bacapfel_wd_timer=1..},limit=1] run function bacapfel:detect/wind_check
execute if entity @a[gamemode=!spectator,advancements={bacapfel:adventure/the_wave=false},limit=1] run function bacapfel:detect/wave
execute as @a run scoreboard players operation @s bacapfel_jumpp = @s bacapfel_jump
