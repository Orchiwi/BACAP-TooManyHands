scoreboard players add #hb_slow bacaptmh_sys 1
function bacaptmh:detect/f4_count
execute if score #players bacaptmh_sys matches 4.. if entity @a[advancements={bacaptmh:potion/group_buff=false},limit=1] run function bacaptmh:detect/group_buff
execute if score #players bacaptmh_sys matches 3.. if entity @a[advancements={bacaptmh:biomes/conduit_club=false},limit=1] run function bacaptmh:detect/conduit_club
execute if score #players bacaptmh_sys matches 4.. if entity @a[advancements={bacaptmh:building/community_beacon=false},limit=1] run function bacaptmh:detect/community_beacon
execute if score #players bacaptmh_sys matches 3.. if entity @a[advancements={bacaptmh:end/congregation=false},limit=1] run function bacaptmh:detect/congregation
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:statistics/long_distance_relationship=false}] at @s if entity @a[gamemode=!spectator,distance=10000..,limit=1] run function bacaptmh:detect/long_distance
execute if score #players bacaptmh_sys matches 3.. if entity @a[advancements={bacaptmh:challenges/all_for_one=false},limit=1] run function bacaptmh:detect/all_for_one
execute if score #players bacaptmh_sys matches 3.. if entity @a[advancements={bacaptmh:challenges/sculk_silence=false},limit=1] run function bacaptmh:detect/sculk_silence
execute if score #timer bacaptmh_gaunt matches 1.. run scoreboard players remove #timer bacaptmh_gaunt 100
execute if entity @a[advancements={bacaptmh:adventure/reunion=false},limit=1] run function bacaptmh:detect/reunion
execute if entity @a[advancements={bacaptmh:adventure/split_the_party=false},limit=1] run function bacaptmh:detect/split_the_party
execute if entity @a[advancements={bacaptmh:adventure/team_photo=false},limit=1] run function bacaptmh:detect/team_photo
execute if entity @a[advancements={bacaptmh:adventure/raid_party=false},limit=1] run function bacaptmh:detect/raid_party
scoreboard players set #need bacaptmh_n 0
execute if entity @a[advancements={bacaptmh:adventure/matching_outfits=false},limit=1] run scoreboard players set #need bacaptmh_n 1
execute if entity @a[advancements={bacaptmh:adventure/dress_code=false},limit=1] run scoreboard players set #need bacaptmh_n 1
execute if entity @a[advancements={bacaptmh:adventure/fashion_police=false},limit=1] run scoreboard players set #need bacaptmh_n 1
execute if score #need bacaptmh_n matches 1 run function bacaptmh:detect/outfits
