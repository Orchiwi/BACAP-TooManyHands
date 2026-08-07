# A1 Fair Trade - you gave an item that another player picked up AND picked up an
# item another player threw, both inside 5 s. Both criteria carry the diamonds_to_you
# self-pickup guard, so neither can be produced by dropping and re-collecting your own item.
# Only the player who holds both halves is needed, so a partner who already owns the
# advancement can still take part.
scoreboard players remove @a[scores={bacaptmh_a1_give=1..}] bacaptmh_a1_give 1
scoreboard players remove @a[scores={bacaptmh_a1_get=1..}] bacaptmh_a1_get 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/fair_trade={gave=true,guard=false}}] run scoreboard players set @s bacaptmh_a1_give 10
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/fair_trade={got=true,guard=false}}] run scoreboard players set @s bacaptmh_a1_get 10
advancement revoke @a[advancements={bacaptmh:adventure/fair_trade=false}] only bacaptmh:adventure/fair_trade gave
advancement revoke @a[advancements={bacaptmh:adventure/fair_trade=false}] only bacaptmh:adventure/fair_trade got
execute as @a[gamemode=!spectator,scores={bacaptmh_a1_give=1..,bacaptmh_a1_get=1..}] run function bacaptmh:detect/fair_trade_grant
