# run as the thrower: this victim has not been counted in this window yet
scoreboard players add @s bacaptmh_sb_count 1
execute if score @s bacaptmh_sb_count matches 1 run scoreboard players operation @s bacaptmh_sb_v1 = #sbvic bacaptmh_sys
execute if score @s bacaptmh_sb_count matches 2 run scoreboard players operation @s bacaptmh_sb_v2 = #sbvic bacaptmh_sys
execute if score @s bacaptmh_sb_count matches 3.. run scoreboard players operation @s bacaptmh_sb_v3 = #sbvic bacaptmh_sys
execute if score @s bacaptmh_sb_count matches 3.. run function bacaptmh:detect/snowball_grant
