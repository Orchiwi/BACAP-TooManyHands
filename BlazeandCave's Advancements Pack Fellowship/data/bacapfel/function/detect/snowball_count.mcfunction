# run as the thrower: this victim has not been counted in this window yet
scoreboard players add @s bacapfel_sb_count 1
execute if score @s bacapfel_sb_count matches 1 run scoreboard players operation @s bacapfel_sb_v1 = #sbvic bacapfel_sys
execute if score @s bacapfel_sb_count matches 2 run scoreboard players operation @s bacapfel_sb_v2 = #sbvic bacapfel_sys
execute if score @s bacapfel_sb_count matches 3.. run scoreboard players operation @s bacapfel_sb_v3 = #sbvic bacapfel_sys
execute if score @s bacapfel_sb_count matches 3.. run function bacapfel:detect/snowball_grant
