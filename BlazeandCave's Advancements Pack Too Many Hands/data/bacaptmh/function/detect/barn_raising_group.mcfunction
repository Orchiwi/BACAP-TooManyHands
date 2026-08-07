# @s just topped a hundred blocks. Are two more builders sitting on the same chunk?
scoreboard players operation #brx bacaptmh_tmp4 = @s bacaptmh_cx
scoreboard players operation #brz bacaptmh_tmp4 = @s bacaptmh_cz
scoreboard players operation #brd bacaptmh_tmp4 = @s bacaptmh_cd
scoreboard players set #brn bacaptmh_tmp4 0
execute as @a[gamemode=!spectator,scores={bacaptmh_barn=100..}] if score @s bacaptmh_cx = #brx bacaptmh_tmp4 if score @s bacaptmh_cz = #brz bacaptmh_tmp4 if score @s bacaptmh_cd = #brd bacaptmh_tmp4 run scoreboard players add #brn bacaptmh_tmp4 1
execute if score #brn bacaptmh_tmp4 matches 3.. run function bacaptmh:detect/barn_raising_grant
