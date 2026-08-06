# Five different trim materials worn as full suits within sight of each other. Exactly
# one wearer is credited per material - the same one-per-category trick split_mark uses
# for dimensions - so seven people wearing five materials between them do not all
# collect. A player can only ever hold one index, so five tags means five people.
tag @a remove bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=1},limit=1] add bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=2},limit=1] add bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=3},limit=1] add bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=4},limit=1] add bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=5},limit=1] add bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=6},limit=1] add bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=7},limit=1] add bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=8},limit=1] add bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=9},limit=1] add bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=10},limit=1] add bacapfel_fashion
tag @a[gamemode=!spectator,distance=..32,scores={bacapfel_dress_t=11},limit=1] add bacapfel_fashion
execute store result score #c bacapfel_n if entity @a[tag=bacapfel_fashion]
execute if score #c bacapfel_n matches 5.. run advancement grant @a[tag=bacapfel_fashion] only bacapfel:adventure/fashion_police
tag @a remove bacapfel_fashion
