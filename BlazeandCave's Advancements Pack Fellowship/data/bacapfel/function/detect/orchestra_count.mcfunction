scoreboard players set #sum bacapfel_horn 0
scoreboard players operation #sum bacapfel_horn += #ponder bacapfel_horn
scoreboard players operation #sum bacapfel_horn += #sing bacapfel_horn
scoreboard players operation #sum bacapfel_horn += #seek bacapfel_horn
scoreboard players operation #sum bacapfel_horn += #feel bacapfel_horn
scoreboard players operation #sum bacapfel_horn += #admire bacapfel_horn
scoreboard players operation #sum bacapfel_horn += #call bacapfel_horn
scoreboard players operation #sum bacapfel_horn += #yearn bacapfel_horn
scoreboard players operation #sum bacapfel_horn += #dream bacapfel_horn
execute store result score #p bacapfel_horn if entity @a[tag=bacapfel_horn]
execute if score #sum bacapfel_horn matches 4.. if score #p bacapfel_horn matches 4.. run function bacapfel:detect/orchestra_win
