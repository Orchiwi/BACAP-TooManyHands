# consume the window along with the grant so nothing is left lying around
scoreboard players set @s bacapfel_sb_count 0
scoreboard players set @s bacapfel_sb_timer 0
scoreboard players set @s bacapfel_sb_v1 0
scoreboard players set @s bacapfel_sb_v2 0
scoreboard players set @s bacapfel_sb_v3 0
execute if entity @s[gamemode=!spectator,advancements={bacapfel:weaponry/snowball_war=false}] run advancement grant @s only bacapfel:weaponry/snowball_war
