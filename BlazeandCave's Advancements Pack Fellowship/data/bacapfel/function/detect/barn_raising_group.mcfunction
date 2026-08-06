# @s just topped a hundred blocks. Are two more builders sitting on the same chunk?
scoreboard players operation #brx bacapfel_tmp4 = @s bacapfel_cx
scoreboard players operation #brz bacapfel_tmp4 = @s bacapfel_cz
scoreboard players operation #brd bacapfel_tmp4 = @s bacapfel_cd
scoreboard players set #brn bacapfel_tmp4 0
execute as @a[gamemode=!spectator,scores={bacapfel_barn=100..}] if score @s bacapfel_cx = #brx bacapfel_tmp4 if score @s bacapfel_cz = #brz bacapfel_tmp4 if score @s bacapfel_cd = #brd bacapfel_tmp4 run scoreboard players add #brn bacapfel_tmp4 1
execute if score #brn bacapfel_tmp4 matches 3.. run function bacapfel:detect/barn_raising_grant
