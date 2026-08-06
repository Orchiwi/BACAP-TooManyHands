# A3 Hot Potato - a relay: at least one player who both received and passed on inside
# 10 s, with four people in the chain. Self-pickup is excluded by the criteria.
scoreboard players add @a[gamemode=!spectator] bacapfel_a3_give 0
scoreboard players add @a[gamemode=!spectator] bacapfel_a3_get 0
scoreboard players remove @a[scores={bacapfel_a3_give=1..}] bacapfel_a3_give 1
scoreboard players remove @a[scores={bacapfel_a3_get=1..}] bacapfel_a3_get 1
execute as @a[gamemode=!spectator,advancements={bacapfel:adventure/hot_potato={gave=true,guard=false}}] run scoreboard players set @s bacapfel_a3_give 20
execute as @a[gamemode=!spectator,advancements={bacapfel:adventure/hot_potato={got=true,guard=false}}] run scoreboard players set @s bacapfel_a3_get 20
advancement revoke @a[advancements={bacapfel:adventure/hot_potato=false}] only bacapfel:adventure/hot_potato gave
advancement revoke @a[advancements={bacapfel:adventure/hot_potato=false}] only bacapfel:adventure/hot_potato got
execute as @a[gamemode=!spectator,scores={bacapfel_a3_give=1..,bacapfel_a3_get=1..}] at @s run function bacapfel:detect/hot_potato_check
