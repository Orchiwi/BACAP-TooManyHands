# run as the thrower, with #sbvic holding the victim's permanent id. The three victims
# are remembered on the thrower, not on the victim: a single shared slot on the victim
# meant a second thrower could overwrite the first thrower's record and let the same
# player be counted twice in one window.
execute unless score @s bacaptmh_sb_timer matches 1.. run function bacaptmh:detect/snowball_open
scoreboard players set #sbseen bacaptmh_sys 0
execute if score @s bacaptmh_sb_v1 = #sbvic bacaptmh_sys run scoreboard players set #sbseen bacaptmh_sys 1
execute if score @s bacaptmh_sb_v2 = #sbvic bacaptmh_sys run scoreboard players set #sbseen bacaptmh_sys 1
execute if score @s bacaptmh_sb_v3 = #sbvic bacaptmh_sys run scoreboard players set #sbseen bacaptmh_sys 1
execute if score #sbseen bacaptmh_sys matches 0 run function bacaptmh:detect/snowball_count
