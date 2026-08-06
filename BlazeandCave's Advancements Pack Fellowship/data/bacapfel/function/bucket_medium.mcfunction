scoreboard players add #hb_medium bacapfel_sys 1
# Seed any player the pack has not seen yet - late joiners included.
execute as @a[gamemode=!spectator] unless score @s bacapfel_f2init matches 1 run function bacapfel:detect/f2_init
# --- Fellowship batch F3 -------------------------------------------------------
# Online players are COUNTED, not tested with a limit= selector: 'if entity @a[limit=N]'
# only ever asks whether at least one player matches, so it guards nothing.
scoreboard players set #players bacapfel_sys 0
execute as @a[gamemode=!spectator] run scoreboard players add #players bacapfel_sys 1
execute store result score #f3now bacapfel_tmp run time query gametime
scoreboard players operation #f3cut100 bacapfel_tmp = #f3now bacapfel_tmp
scoreboard players remove #f3cut100 bacapfel_tmp 100
scoreboard players operation #f3cut200 bacapfel_tmp = #f3now bacapfel_tmp
scoreboard players remove #f3cut200 bacapfel_tmp 200
scoreboard players operation #f3cut1200 bacapfel_tmp = #f3now bacapfel_tmp
scoreboard players remove #f3cut1200 bacapfel_tmp 1200
scoreboard players operation #f3cut2400 bacapfel_tmp = #f3now bacapfel_tmp
scoreboard players remove #f3cut2400 bacapfel_tmp 2400
# Statistic mirrors and the death stamp are refreshed for everyone, every window, ungated.
execute as @a[gamemode=!spectator] run function bacapfel:detect/sample
execute if score #players bacapfel_sys matches 2.. if entity @a[gamemode=!spectator,advancements={bacapfel:end/tag_team=false},limit=1] in minecraft:the_end as @e[type=ender_dragon,limit=1] at @s run function bacapfel:detect/tag_team
execute if score #players bacapfel_sys matches 3.. as @a[gamemode=!spectator,advancements={bacapfel:monsters/wither_committee=false}] at @s if entity @e[type=wither,distance=..20] run function bacapfel:detect/wither_committee
execute if score #players bacapfel_sys matches 3.. as @a[gamemode=!spectator,advancements={bacapfel:monsters/warden_party=false}] at @s if entity @e[type=warden,distance=..16] run function bacapfel:detect/warden_party
execute if score #players bacapfel_sys matches 2.. if entity @a[gamemode=!spectator,advancements={bacapfel:monsters/assist=false},limit=1] as @a[gamemode=!spectator,gamemode=!creative,scores={bacapfel_dmgd=1..}] at @s run function bacapfel:detect/assist
execute if score #players bacapfel_sys matches 3.. if entity @a[gamemode=!spectator,advancements={bacapfel:monsters/total_party_kill=false},limit=1] run function bacapfel:detect/total_party_kill
execute if score #players bacapfel_sys matches 2.. as @a[gamemode=!spectator,advancements={bacapfel:animal/carpool=false}] run function bacapfel:detect/carpool
execute if score #players bacapfel_sys matches 2.. as @a[gamemode=!spectator,advancements={bacapfel:animal/two_hump_transit=false}] run function bacapfel:detect/two_hump_transit
execute if score #players bacapfel_sys matches 4.. as @a[gamemode=!spectator,advancements={bacapfel:animal/cavalry_charge=false}] at @s run function bacapfel:detect/cavalry_charge
execute if score #players bacapfel_sys matches 4.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacapfel:redstone/convoy=false}] at @s run function bacapfel:detect/convoy
execute if score #players bacapfel_sys matches 3.. as @a[gamemode=!spectator,advancements={bacapfel:animal/pack_leaders=false}] at @s run function bacapfel:detect/pack_leaders
execute if score #players bacapfel_sys matches 3.. as @a[gamemode=!spectator,advancements={bacapfel:biomes/submarine_crew=false}] at @s run function bacapfel:detect/submarine_crew
execute if score #players bacapfel_sys matches 4.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacapfel:nether/ghast_fleet=false}] at @s run function bacapfel:detect/ghast_fleet
function bacapfel:detect/f4_count
execute as @a unless score @s bacapfel_init matches 1 run function bacapfel:detect/f4_init
function bacapfel:detect/tick_windows
function bacapfel:detect/tick_marks
execute as @a at @s run function bacapfel:detect/nether_express_dim
execute as @a[gamemode=!spectator,advancements={bacapfel:redstone/trapped={opened=true,impossible=false}}] at @s run function bacapfel:detect/trapped
execute if score #players bacapfel_sys matches 4.. if entity @a[advancements={bacapfel:building/firework_finale=false},limit=1] as @a[gamemode=!spectator,scores={bacapfel_fwt=1..}] at @s run function bacapfel:detect/firework_finale
execute if score #players bacapfel_sys matches 4.. if entity @a[advancements={bacapfel:nether/nether_express=false},limit=1] run function bacapfel:detect/nether_express
execute if score #players bacapfel_sys matches 4.. if entity @a[advancements={bacapfel:challenges/insurance_policy=false},limit=1] as @a[gamemode=!spectator,scores={bacapfel_tott=1..}] at @s run function bacapfel:detect/insurance_policy
execute if score #players bacapfel_sys matches 3.. if entity @a[advancements={bacapfel:challenges/formation_flying=false},limit=1] run function bacapfel:detect/formation_flying
scoreboard players set #f2players bacapfel_sys 0
execute if entity @a[limit=1] run function bacapfel:detect/f2_events
execute if score #f2players bacapfel_sys matches 2.. if entity @a[scores={bacapfel_ekill=1..,bacapfel_edeath=1..},limit=1] run function bacapfel:detect/mutual_destruction
execute if entity @a[gamemode=!spectator,advancements={bacapfel:weaponry/falling_out=false},limit=1] run function bacapfel:detect/anvil
execute if score #f2players bacapfel_sys matches 3.. if entity @a[scores={bacapfel_eblock=1..},limit=1] run function bacapfel:detect/shield_wall
execute if entity @a[gamemode=!spectator,advancements={bacapfel:weaponry/trident_tag=false},limit=1] run function bacapfel:detect/trident_tag
scoreboard players remove @a[scores={bacapfel_toss=1..}] bacapfel_toss 1
execute as @a[gamemode=!spectator] if score @s bacapfel_drop > @s bacapfel_dropp run scoreboard players set @s bacapfel_toss 20
execute if entity @a[advancements={bacapfel:adventure/fair_trade=false},limit=1] run function bacapfel:detect/fair_trade
execute if entity @a[advancements={bacapfel:adventure/secret_santa=false},limit=1] run function bacapfel:detect/secret_santa
execute if entity @a[advancements={bacapfel:adventure/hot_potato=false},limit=1] run function bacapfel:detect/hot_potato
execute if entity @a[advancements={bacapfel:adventure/vault_crew=false},limit=1] run function bacapfel:detect/vault_crew
execute if entity @a[advancements={bacapfel:adventure/group_nap=false},limit=1] run function bacapfel:detect/group_nap
execute if entity @a[advancements={bacapfel:adventure/orchestra=false},limit=1] run function bacapfel:detect/orchestra
execute as @a run scoreboard players operation @s bacapfel_sleepp = @s bacapfel_sleep
execute as @a run scoreboard players operation @s bacapfel_ghornp = @s bacapfel_ghorn
execute as @a run scoreboard players operation @s bacapfel_dropp = @s bacapfel_drop
# A11 Shared Custody - stamp on naming, pay out on feeding somebody else's animal.
execute as @a[gamemode=!spectator,advancements={bacapfel:adventure/shared_custody={named=true,guard=false}}] at @s run function bacapfel:detect/custody_name
execute as @a[gamemode=!spectator,advancements={bacapfel:adventure/shared_custody={fed=true,guard=false}}] at @s run function bacapfel:detect/custody_feed
