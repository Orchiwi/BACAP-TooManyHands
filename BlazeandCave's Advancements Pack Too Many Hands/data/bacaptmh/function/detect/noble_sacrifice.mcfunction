# Noble Sacrifice. Called once per medium tick while two or more players are online.
#
# The 'fell' criterion (entity_killed_player by a Wither) is persistent, so it is CONSUMED
# here with a revoke - the idiom Field Medic uses - and turned into a 120-window (120 medium
# ticks, 1200 game ticks, sixty seconds). Without that, a death months ago would be paid out
# by an unrelated Wither kill today.
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/noble_sacrifice={fell=true,impossible=false}}] run scoreboard players set @s bacaptmh_ns 120
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/noble_sacrifice={fell=true,impossible=false}}] run advancement revoke @s only bacaptmh:monsters/noble_sacrifice fell

# The avenger is whoever's minecraft.killed:minecraft.wither rose in this window. The mirror is
# only updated at the END of bucket_medium, after The Relay has read the same delta, so neither
# detector can eat the other's event.
execute as @a[gamemode=!spectator] if score @s bacaptmh_kwither > @s bacaptmh_kwitherp run tag @s add bacaptmh_avenger

# Payout goes to the fallen only, and never to the avenger himself: a player who dies to his own
# Wither, respawns and finishes it is exactly the solo case this advancement must refuse. That is
# also why the killer is not granted alongside them - granting him would reopen the solo path.
execute if entity @a[tag=bacaptmh_avenger,limit=1] run advancement grant @a[gamemode=!spectator,tag=!bacaptmh_avenger,scores={bacaptmh_ns=1..}] only bacaptmh:monsters/noble_sacrifice
tag @a remove bacaptmh_avenger
