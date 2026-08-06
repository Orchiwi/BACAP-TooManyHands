# A2 Secret Santa - four players together swapping items inside 10 s.
# Self-pickup is excluded by the criteria themselves.
scoreboard players remove @a[scores={bacapfel_a2_give=1..}] bacapfel_a2_give 1
scoreboard players remove @a[scores={bacapfel_a2_get=1..}] bacapfel_a2_get 1
execute as @a[gamemode=!spectator,advancements={bacapfel:adventure/secret_santa={gave=true,guard=false}}] run scoreboard players set @s bacapfel_a2_give 20
execute as @a[gamemode=!spectator,advancements={bacapfel:adventure/secret_santa={got=true,guard=false}}] run scoreboard players set @s bacapfel_a2_get 20
advancement revoke @a[advancements={bacapfel:adventure/secret_santa=false}] only bacapfel:adventure/secret_santa gave
advancement revoke @a[advancements={bacapfel:adventure/secret_santa=false}] only bacapfel:adventure/secret_santa got
execute as @a[gamemode=!spectator,scores={bacapfel_a2_give=1..,bacapfel_a2_get=1..}] at @s run function bacapfel:detect/secret_santa_check
