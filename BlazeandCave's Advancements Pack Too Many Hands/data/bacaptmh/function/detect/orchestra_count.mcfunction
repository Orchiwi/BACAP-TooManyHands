scoreboard players set #sum bacaptmh_horn 0
scoreboard players operation #sum bacaptmh_horn += #ponder bacaptmh_horn
scoreboard players operation #sum bacaptmh_horn += #sing bacaptmh_horn
scoreboard players operation #sum bacaptmh_horn += #seek bacaptmh_horn
scoreboard players operation #sum bacaptmh_horn += #feel bacaptmh_horn
scoreboard players operation #sum bacaptmh_horn += #admire bacaptmh_horn
scoreboard players operation #sum bacaptmh_horn += #call bacaptmh_horn
scoreboard players operation #sum bacaptmh_horn += #yearn bacaptmh_horn
scoreboard players operation #sum bacaptmh_horn += #dream bacaptmh_horn
execute store result score #p bacaptmh_horn if entity @a[tag=bacaptmh_horn]
execute if score #sum bacaptmh_horn matches 4.. if score #p bacaptmh_horn matches 4.. run function bacaptmh:detect/orchestra_win
