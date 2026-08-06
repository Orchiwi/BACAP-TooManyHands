# Run only from a middle link (someone who both received and passed on). The chain is
# the union of givers and receivers here, plus holders who threw an item inside the same
# 10 s window - holders cannot latch criteria any more, but they can still show a live
# Items Dropped event. Nobody is counted for merely being present.
execute store result score #f bacapfel_n if entity @a[gamemode=!spectator,distance=..16,scores={bacapfel_a3_give=1..}]
execute store result score #g bacapfel_n if entity @a[gamemode=!spectator,distance=..16,scores={bacapfel_a3_give=0,bacapfel_a3_get=1..}]
execute store result score #v bacapfel_n if entity @a[gamemode=!spectator,distance=..16,scores={bacapfel_toss=1..},advancements={bacapfel:adventure/hot_potato=true}]
scoreboard players operation #f bacapfel_n += #g bacapfel_n
scoreboard players operation #f bacapfel_n += #v bacapfel_n
execute if score #f bacapfel_n matches 4.. run function bacapfel:detect/hot_potato_grant
