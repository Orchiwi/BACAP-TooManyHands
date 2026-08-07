# consume the window along with the grant so nothing is left lying around
scoreboard players set @s bacaptmh_sb_count 0
scoreboard players set @s bacaptmh_sb_timer 0
scoreboard players set @s bacaptmh_sb_v1 0
scoreboard players set @s bacaptmh_sb_v2 0
scoreboard players set @s bacaptmh_sb_v3 0
execute if entity @s[gamemode=!spectator,advancements={bacaptmh:weaponry/snowball_war=false}] run advancement grant @s only bacaptmh:weaponry/snowball_war
