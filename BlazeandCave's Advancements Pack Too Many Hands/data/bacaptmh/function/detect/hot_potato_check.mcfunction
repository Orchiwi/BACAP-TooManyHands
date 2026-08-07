# Run only from a middle link (someone who both received and passed on). The chain is
# the union of givers and receivers here, plus holders who threw an item inside the same
# 10 s window - holders cannot latch criteria any more, but they can still show a live
# Items Dropped event. Nobody is counted for merely being present.
execute store result score #f bacaptmh_n if entity @a[gamemode=!spectator,distance=..16,scores={bacaptmh_a3_give=1..}]
execute store result score #g bacaptmh_n if entity @a[gamemode=!spectator,distance=..16,scores={bacaptmh_a3_give=0,bacaptmh_a3_get=1..}]
execute store result score #v bacaptmh_n if entity @a[gamemode=!spectator,distance=..16,scores={bacaptmh_toss=1..},advancements={bacaptmh:adventure/hot_potato=true}]
scoreboard players operation #f bacaptmh_n += #g bacaptmh_n
scoreboard players operation #f bacaptmh_n += #v bacaptmh_n
execute if score #f bacaptmh_n matches 4.. run function bacaptmh:detect/hot_potato_grant
