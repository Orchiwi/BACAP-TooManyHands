scoreboard players add #hb_medium bacaptmh_sys 1
# Seed any player the pack has not seen yet - late joiners included.
# --- Too Many Hands batch F3 -------------------------------------------------------
# Online players are COUNTED, not tested with a limit= selector: 'if entity @a[limit=N]'
# only ever asks whether at least one player matches, so it guards nothing.
scoreboard players set #players bacaptmh_sys 0
execute as @a[gamemode=!spectator] run scoreboard players add #players bacaptmh_sys 1
execute store result score #f3now bacaptmh_tmp run time query gametime
scoreboard players operation #f3cut100 bacaptmh_tmp = #f3now bacaptmh_tmp
scoreboard players remove #f3cut100 bacaptmh_tmp 100
scoreboard players operation #f3cut200 bacaptmh_tmp = #f3now bacaptmh_tmp
scoreboard players remove #f3cut200 bacaptmh_tmp 200
scoreboard players operation #f3cut1200 bacaptmh_tmp = #f3now bacaptmh_tmp
scoreboard players remove #f3cut1200 bacaptmh_tmp 1200
scoreboard players operation #f3cut2400 bacaptmh_tmp = #f3now bacaptmh_tmp
scoreboard players remove #f3cut2400 bacaptmh_tmp 2400
# Statistic mirrors and the death stamp are refreshed for everyone, every window, ungated.
execute as @a[gamemode=!spectator] run function bacaptmh:detect/sample
execute if score #players bacaptmh_sys matches 2.. if entity @a[gamemode=!spectator,advancements={bacaptmh:end/tag_team=false},limit=1] in minecraft:the_end as @e[type=ender_dragon,limit=1] at @s run function bacaptmh:detect/tag_team
execute if score #players bacaptmh_sys matches 3.. as @a[gamemode=!spectator,advancements={bacaptmh:monsters/wither_committee=false}] at @s if entity @e[type=wither,distance=..20] run function bacaptmh:detect/wither_committee
execute if score #players bacaptmh_sys matches 3.. as @a[gamemode=!spectator,advancements={bacaptmh:monsters/warden_party=false}] at @s if entity @e[type=warden,distance=..16] run function bacaptmh:detect/warden_party
execute if score #players bacaptmh_sys matches 2.. if entity @a[gamemode=!spectator,advancements={bacaptmh:monsters/assist=false},limit=1] as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_dmgd=1..}] at @s run function bacaptmh:detect/assist
execute if score #players bacaptmh_sys matches 3.. if entity @a[gamemode=!spectator,advancements={bacaptmh:monsters/total_party_kill=false},limit=1] run function bacaptmh:detect/total_party_kill
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:animal/carpool=false}] run function bacaptmh:detect/carpool
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:animal/two_hump_transit=false}] run function bacaptmh:detect/two_hump_transit
execute if score #players bacaptmh_sys matches 4.. as @a[gamemode=!spectator,advancements={bacaptmh:animal/cavalry_charge=false}] at @s run function bacaptmh:detect/cavalry_charge
execute if score #players bacaptmh_sys matches 4.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:redstone/convoy=false}] at @s run function bacaptmh:detect/convoy
execute if score #players bacaptmh_sys matches 3.. as @a[gamemode=!spectator,advancements={bacaptmh:animal/pack_leaders=false}] at @s run function bacaptmh:detect/pack_leaders
execute if score #players bacaptmh_sys matches 3.. as @a[gamemode=!spectator,advancements={bacaptmh:biomes/submarine_crew=false}] at @s run function bacaptmh:detect/submarine_crew
execute if score #players bacaptmh_sys matches 4.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:nether/ghast_fleet=false}] at @s run function bacaptmh:detect/ghast_fleet
function bacaptmh:detect/f4_count
function bacaptmh:detect/tick_windows
function bacaptmh:detect/tick_marks
execute as @a at @s run function bacaptmh:detect/nether_express_dim
execute as @a[gamemode=!spectator,advancements={bacaptmh:redstone/trapped={opened=true,impossible=false}}] at @s run function bacaptmh:detect/trapped
execute if score #players bacaptmh_sys matches 4.. if entity @a[advancements={bacaptmh:building/firework_finale=false},limit=1] as @a[gamemode=!spectator,scores={bacaptmh_fwt=1..}] at @s run function bacaptmh:detect/firework_finale
execute if score #players bacaptmh_sys matches 4.. if entity @a[advancements={bacaptmh:nether/nether_express=false},limit=1] run function bacaptmh:detect/nether_express
execute if score #players bacaptmh_sys matches 4.. if entity @a[advancements={bacaptmh:challenges/insurance_policy=false},limit=1] as @a[gamemode=!spectator,scores={bacaptmh_tott=1..}] at @s run function bacaptmh:detect/insurance_policy
execute if score #players bacaptmh_sys matches 3.. if entity @a[advancements={bacaptmh:challenges/formation_flying=false},limit=1] run function bacaptmh:detect/formation_flying
scoreboard players set #f2players bacaptmh_sys 0
execute if entity @a[limit=1] run function bacaptmh:detect/f2_events
execute if score #f2players bacaptmh_sys matches 2.. if entity @a[scores={bacaptmh_ekill=1..,bacaptmh_edeath=1..},limit=1] run function bacaptmh:detect/mutual_destruction
execute if entity @a[gamemode=!spectator,advancements={bacaptmh:weaponry/falling_out=false},limit=1] run function bacaptmh:detect/anvil
execute if score #f2players bacaptmh_sys matches 3.. if entity @a[scores={bacaptmh_eblock=1..},limit=1] run function bacaptmh:detect/shield_wall
execute if entity @a[gamemode=!spectator,advancements={bacaptmh:weaponry/trident_tag=false},limit=1] run function bacaptmh:detect/trident_tag
scoreboard players remove @a[scores={bacaptmh_toss=1..}] bacaptmh_toss 1
execute as @a[gamemode=!spectator] if score @s bacaptmh_drop > @s bacaptmh_dropp run scoreboard players set @s bacaptmh_toss 20
execute if entity @a[advancements={bacaptmh:adventure/fair_trade=false},limit=1] run function bacaptmh:detect/fair_trade
execute if entity @a[advancements={bacaptmh:adventure/secret_santa=false},limit=1] run function bacaptmh:detect/secret_santa
execute if entity @a[advancements={bacaptmh:adventure/hot_potato=false},limit=1] run function bacaptmh:detect/hot_potato
execute if entity @a[advancements={bacaptmh:adventure/vault_crew=false},limit=1] run function bacaptmh:detect/vault_crew
execute if entity @a[advancements={bacaptmh:adventure/group_nap=false},limit=1] run function bacaptmh:detect/group_nap
execute if entity @a[advancements={bacaptmh:adventure/orchestra=false},limit=1] run function bacaptmh:detect/orchestra
execute as @a run scoreboard players operation @s bacaptmh_sleepp = @s bacaptmh_sleep
execute as @a run scoreboard players operation @s bacaptmh_ghornp = @s bacaptmh_ghorn
execute as @a run scoreboard players operation @s bacaptmh_dropp = @s bacaptmh_drop
# A11 Shared Custody - stamp on naming, pay out on feeding somebody else's animal.
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/shared_custody={named=true,guard=false}}] at @s run function bacaptmh:detect/custody_name
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/shared_custody={fed=true,guard=false}}] at @s run function bacaptmh:detect/custody_feed
