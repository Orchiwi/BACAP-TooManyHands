# A3 Hot Potato - a relay: at least one player who both received and passed on inside
# 10 s, with four people in the chain. Self-pickup is excluded by the criteria.
scoreboard players add @a[gamemode=!spectator] bacaptmh_a3_give 0
scoreboard players add @a[gamemode=!spectator] bacaptmh_a3_get 0
scoreboard players remove @a[scores={bacaptmh_a3_give=1..}] bacaptmh_a3_give 1
scoreboard players remove @a[scores={bacaptmh_a3_get=1..}] bacaptmh_a3_get 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/hot_potato={gave=true,guard=false}}] run scoreboard players set @s bacaptmh_a3_give 20
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/hot_potato={got=true,guard=false}}] run scoreboard players set @s bacaptmh_a3_get 20
advancement revoke @a[advancements={bacaptmh:adventure/hot_potato=false}] only bacaptmh:adventure/hot_potato gave
advancement revoke @a[advancements={bacaptmh:adventure/hot_potato=false}] only bacaptmh:adventure/hot_potato got
execute as @a[gamemode=!spectator,scores={bacaptmh_a3_give=1..,bacaptmh_a3_get=1..}] at @s run function bacaptmh:detect/hot_potato_check
