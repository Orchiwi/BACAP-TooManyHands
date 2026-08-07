scoreboard players add #hb_fast bacaptmh_sys 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:potion/field_medic={dosed=true,impossible=false}}] at @s run function bacaptmh:detect/field_medic
execute as @a[gamemode=!spectator,advancements={bacaptmh:potion/chemical_warfare={gassed=true,impossible=false}}] at @s run function bacaptmh:detect/chemical_warfare
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:building/barn_raising={place=true,impossible=false}}] at @s run function bacaptmh:detect/barn_raising
execute as @a[gamemode=!spectator,advancements={bacaptmh:challenges/the_gauntlet={hand_off=true,impossible=false}}] at @s run function bacaptmh:detect/gauntlet
execute if entity @a[gamemode=!spectator,scores={bacaptmh_wt=1..},limit=1] as @a[gamemode=!spectator,gamemode=!creative] if predicate blazeandcave:is_on_ground run scoreboard players set @s bacaptmh_fall 0
execute if entity @a[gamemode=!spectator,scores={bacaptmh_wt=1..},limit=1] as @a[gamemode=!spectator,gamemode=!creative] at @s unless predicate blazeandcave:is_on_ground run function bacaptmh:detect/trust_fall
execute if score #f2players bacaptmh_sys matches 2.. as @a[gamemode=!spectator] at @s run function bacaptmh:detect/f2_near
execute if entity @a[scores={bacaptmh_wd_timer=1..},limit=1] run function bacaptmh:detect/wind_check
execute if entity @a[gamemode=!spectator,advancements={bacaptmh:adventure/the_wave=false},limit=1] run function bacaptmh:detect/wave
execute as @a run scoreboard players operation @s bacaptmh_jumpp = @s bacaptmh_jump
