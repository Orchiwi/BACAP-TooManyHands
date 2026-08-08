scoreboard players add #hb_slow bacaptmh_sys 1
function bacaptmh:detect/f4_count
execute if score #players bacaptmh_sys matches 4.. if entity @a[advancements={bacaptmh:potion/group_buff=false},limit=1] run function bacaptmh:detect/group_buff
execute if score #players bacaptmh_sys matches 3.. if entity @a[advancements={bacaptmh:biomes/conduit_club=false},limit=1] run function bacaptmh:detect/conduit_club
execute if score #players bacaptmh_sys matches 4.. if entity @a[advancements={bacaptmh:building/community_beacon=false},limit=1] run function bacaptmh:detect/community_beacon
execute if score #players bacaptmh_sys matches 4.. if entity @a[advancements={bacaptmh:end/congregation=false},limit=1] run function bacaptmh:detect/congregation
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:statistics/long_distance_relationship=false}] at @s if entity @a[gamemode=!spectator,distance=10000..,limit=1] run function bacaptmh:detect/long_distance
execute if score #players bacaptmh_sys matches 4.. if entity @a[advancements={bacaptmh:challenges/all_for_one=false},limit=1] run function bacaptmh:detect/all_for_one
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
# --- expansion ---
# --- mp5 -------------------------------------------------------------------------
# Ungated: the shared deathCount has to be consumed every window, streak or no streak.
function bacaptmh:detect/nobody_dies_tonight
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:end/the_ferryman_cometh=false}] at @s if dimension minecraft:the_end run function bacaptmh:detect/ferryman
# Serial Offender needs no detector: bacaptmh_pk50 is a lifetime playerKillCount threshold,
# not a delta, so there is nothing to seed and nothing to consume.
execute as @a[gamemode=!spectator,scores={bacaptmh_pk50=50..},advancements={bacaptmh:statistics/serial_offender=false}] run advancement grant @s only bacaptmh:statistics/serial_offender
# --- Too Many Hands batch mp3 -------------------------------------------------------
# Not gated per-player on the advancement, so a finisher's partner still has live numbers.
execute if score #players bacaptmh_sys matches 2.. if entity @a[gamemode=!spectator,advancements={bacaptmh:statistics/the_amazing_race=false},limit=1] as @a[gamemode=!spectator,gamemode=!creative] at @s run function bacaptmh:detect/the_amazing_race
# --- batch mp7: Trading Floor ------------------------------------------------------
# The harvest is UNGATED on purpose. Gating it on 'somebody still lacks it' would freeze
# every mirror the moment the last holder earned it, and the first delta after that would
# be a lifetime traded_with_villager total.
execute as @a[gamemode=!spectator] run function bacaptmh:detect/trading_floor
scoreboard players set #contrib bacaptmh_tf 0
execute as @a[gamemode=!spectator,scores={bacaptmh_tradec=100..}] run scoreboard players add #contrib bacaptmh_tf 1
execute if score #pool bacaptmh_tf matches 1000.. if score #contrib bacaptmh_tf matches 2.. run advancement grant @a[gamemode=!spectator,scores={bacaptmh_tradec=1..}] only bacaptmh:statistics/trading_floor
# --- mp8 A11 Scale Model ------------------------------------------------------------
# bucket_slow is a 5 s window, so 120 of them is the ten minutes a pair gets to split up
# and find two Overworld portals. Its own head count, independent of bucket ordering.
scoreboard players set #np8s bacaptmh_m8 0
execute as @a[gamemode=!spectator] run scoreboard players add #np8s bacaptmh_m8 1
execute as @a[scores={bacaptmh_sm=1..}] run scoreboard players remove @s bacaptmh_sm 1
# distance=0.1..5 excludes the running player, whose distance to himself is always 0,
# without the 'if entity @a[limit=2]' trap of testing for merely one match.
execute if score #np8s bacaptmh_m8 matches 2.. as @a[gamemode=!spectator] at @s if dimension minecraft:the_nether if entity @a[gamemode=!spectator,distance=0.1..5,limit=1] run scoreboard players set @s bacaptmh_sm 120
execute if score #np8s bacaptmh_m8 matches 2.. as @a[gamemode=!spectator,scores={bacaptmh_sm=1..},advancements={bacaptmh:nether/scale_model=false}] at @s run function bacaptmh:detect/scale_model
# --- Too Many Hands batch mp12: Antipodes -------------------------------------------
# No player-count gate is needed: the pair function is only ever reached through a
# distance=6000.. selector, which cannot match without a second player in this dimension.
execute as @a[gamemode=!spectator,advancements={bacaptmh:statistics/antipodes=false}] at @s run function bacaptmh:detect/antipodes
# --- expansion ---
# --- Too Many Hands batch MPFILL2 ---------------------------------------------------
# Body Count is the only function-layer entry in this batch. bacaptmh_bcd is a private
# deathCount objective seeded to 0 in bacaptmh:seed, never here, so a pre-existing
# lifetime death total can never be read as progress. Only players who have already
# crossed ten deaths and still lack the advancement run the detector, so on a normal
# server this line resolves to nothing and the function never executes.
execute as @a[gamemode=!spectator,scores={bacaptmh_bcd=10..},advancements={bacaptmh:statistics/body_count=false}] run function bacaptmh:detect/body_count
