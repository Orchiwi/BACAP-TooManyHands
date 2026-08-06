scoreboard players add #hb_slow bacapfel_sys 1
function bacapfel:detect/f4_count
execute if score #players bacapfel_sys matches 4.. if entity @a[advancements={bacapfel:potion/group_buff=false},limit=1] run function bacapfel:detect/group_buff
execute if score #players bacapfel_sys matches 3.. if entity @a[advancements={bacapfel:biomes/conduit_club=false},limit=1] run function bacapfel:detect/conduit_club
execute if score #players bacapfel_sys matches 4.. if entity @a[advancements={bacapfel:building/community_beacon=false},limit=1] run function bacapfel:detect/community_beacon
execute if score #players bacapfel_sys matches 3.. if entity @a[advancements={bacapfel:end/congregation=false},limit=1] run function bacapfel:detect/congregation
execute if score #players bacapfel_sys matches 2.. as @a[gamemode=!spectator,advancements={bacapfel:statistics/long_distance_relationship=false}] at @s if entity @a[gamemode=!spectator,distance=10000..,limit=1] run function bacapfel:detect/long_distance
execute if score #players bacapfel_sys matches 3.. if entity @a[advancements={bacapfel:challenges/all_for_one=false},limit=1] run function bacapfel:detect/all_for_one
execute if score #players bacapfel_sys matches 3.. if entity @a[advancements={bacapfel:challenges/sculk_silence=false},limit=1] run function bacapfel:detect/sculk_silence
execute if score #timer bacapfel_gaunt matches 1.. run scoreboard players remove #timer bacapfel_gaunt 100
execute if entity @a[advancements={bacapfel:adventure/reunion=false},limit=1] run function bacapfel:detect/reunion
execute if entity @a[advancements={bacapfel:adventure/split_the_party=false},limit=1] run function bacapfel:detect/split_the_party
execute if entity @a[advancements={bacapfel:adventure/team_photo=false},limit=1] run function bacapfel:detect/team_photo
execute if entity @a[advancements={bacapfel:adventure/raid_party=false},limit=1] run function bacapfel:detect/raid_party
scoreboard players set #need bacapfel_n 0
execute if entity @a[advancements={bacapfel:adventure/matching_outfits=false},limit=1] run scoreboard players set #need bacapfel_n 1
execute if entity @a[advancements={bacapfel:adventure/dress_code=false},limit=1] run scoreboard players set #need bacapfel_n 1
execute if entity @a[advancements={bacapfel:adventure/fashion_police=false},limit=1] run scoreboard players set #need bacapfel_n 1
execute if score #need bacapfel_n matches 1 run function bacapfel:detect/outfits
