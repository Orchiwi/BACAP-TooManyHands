# Raise command limits, matching what BACAP and Enhanced Discoveries do
execute in minecraft:overworld run gamerule max_command_forks 999999999
execute in minecraft:the_nether run gamerule max_command_forks 999999999
execute in minecraft:the_end run gamerule max_command_forks 999999999
execute in minecraft:overworld run gamerule max_command_sequence_length 999999999
execute in minecraft:the_nether run gamerule max_command_sequence_length 999999999
execute in minecraft:the_end run gamerule max_command_sequence_length 999999999

scoreboard objectives add bacapfel_sys dummy
scoreboard objectives add bacapfel_tmp dummy
scoreboard objectives add bacapfel_dmg minecraft.custom:minecraft.damage_dealt
scoreboard objectives add bacapfel_dmgp dummy
scoreboard objectives add bacapfel_dmgd dummy
scoreboard objectives add bacapfel_dmgt dummy
scoreboard objectives add bacapfel_dgt dummy
scoreboard objectives add bacapfel_cart minecraft.custom:minecraft.minecart_one_cm
scoreboard objectives add bacapfel_cartp dummy
scoreboard objectives add bacapfel_cartd dummy
scoreboard objectives add bacapfel_deaths deathCount
scoreboard objectives add bacapfel_dtime dummy
scoreboard objectives add bacapfel_tmp4 dummy
scoreboard objectives add bacapfel_init dummy
scoreboard objectives add bacapfel_splash minecraft.used:minecraft.splash_potion
scoreboard objectives add bacapfel_splash_m dummy
scoreboard objectives add bacapfel_medic dummy
scoreboard objectives add bacapfel_lpot minecraft.used:minecraft.lingering_potion
scoreboard objectives add bacapfel_lpot_m dummy
scoreboard objectives add bacapfel_ling dummy
scoreboard objectives add bacapfel_gas dummy
scoreboard objectives add bacapfel_gb dummy
scoreboard objectives add bacapfel_gbm dummy
scoreboard objectives add bacapfel_barn dummy
scoreboard objectives add bacapfel_cx dummy
scoreboard objectives add bacapfel_cz dummy
scoreboard objectives add bacapfel_cd dummy
scoreboard objectives add bacapfel_wbucket minecraft.used:minecraft.water_bucket
scoreboard objectives add bacapfel_wbucket_m dummy
scoreboard objectives add bacapfel_wt dummy
scoreboard objectives add bacapfel_fall dummy
scoreboard objectives add bacapfel_tchest minecraft.used:minecraft.trapped_chest
scoreboard objectives add bacapfel_tchest_m dummy
scoreboard objectives add bacapfel_tct dummy
scoreboard objectives add bacapfel_fw minecraft.used:minecraft.firework_rocket
scoreboard objectives add bacapfel_fw_m dummy
scoreboard objectives add bacapfel_fwt dummy
scoreboard objectives add bacapfel_dim dummy
scoreboard objectives add bacapfel_pt dummy
scoreboard objectives add bacapfel_totem minecraft.used:minecraft.totem_of_undying
scoreboard objectives add bacapfel_totem_m dummy
scoreboard objectives add bacapfel_tott dummy
scoreboard objectives add bacapfel_gaunt dummy
scoreboard objectives add bacapfel_dd dummy
scoreboard objectives add bacapfel_y dummy
scoreboard objectives add bacapfel_form dummy
scoreboard objectives add bacapfel_pkill playerKillCount
scoreboard objectives add bacapfel_death deathCount
scoreboard objectives add bacapfel_blocked minecraft.custom:minecraft.damage_blocked_by_shield
scoreboard objectives add bacapfel_ekill dummy
scoreboard objectives add bacapfel_edeath dummy
scoreboard objectives add bacapfel_eblock dummy
scoreboard objectives add bacapfel_f2init dummy
scoreboard objectives add bacapfel_pid dummy
scoreboard objectives add bacapfel_sb_timer dummy
scoreboard objectives add bacapfel_sb_count dummy
scoreboard objectives add bacapfel_sb_v1 dummy
scoreboard objectives add bacapfel_sb_v2 dummy
scoreboard objectives add bacapfel_sb_v3 dummy
scoreboard objectives add bacapfel_armed dummy
scoreboard objectives add bacapfel_anvilv dummy
scoreboard objectives add bacapfel_anvfrom dummy
scoreboard objectives add bacapfel_sw_near dummy
scoreboard objectives add bacapfel_wd_timer dummy
scoreboard objectives add bacapfel_wd_base dummy
scoreboard objectives add bacapfel_wd_now dummy
scoreboard objectives add bacapfel_wd_from dummy
scoreboard objectives add bacapfel_tt_win dummy
scoreboard objectives add bacapfel_n dummy
scoreboard objectives add bacapfel_a1_give dummy
scoreboard objectives add bacapfel_a1_get dummy
scoreboard objectives add bacapfel_a2_give dummy
scoreboard objectives add bacapfel_a2_get dummy
scoreboard objectives add bacapfel_a3_give dummy
scoreboard objectives add bacapfel_a3_get dummy
scoreboard objectives add bacapfel_drop minecraft.custom:minecraft.drop
scoreboard objectives add bacapfel_dropp dummy
scoreboard objectives add bacapfel_toss dummy
scoreboard objectives add bacapfel_alone dummy
scoreboard objectives add bacapfel_far dummy
scoreboard objectives add bacapfel_wave dummy
scoreboard objectives add bacapfel_jump minecraft.custom:minecraft.jump
scoreboard objectives add bacapfel_jumpp dummy
scoreboard objectives add bacapfel_dye dummy
scoreboard objectives add bacapfel_dress_m dummy
scoreboard objectives add bacapfel_dress_t dummy
scoreboard objectives add bacapfel_nap dummy
scoreboard objectives add bacapfel_sleep minecraft.custom:minecraft.sleep_in_bed
scoreboard objectives add bacapfel_sleepp dummy
scoreboard objectives add bacapfel_vault dummy
scoreboard objectives add bacapfel_horn dummy
scoreboard objectives add bacapfel_ghorn minecraft.used:minecraft.goat_horn
scoreboard objectives add bacapfel_ghornp dummy
scoreboard objectives add bacapfel_owner dummy

# The Gauntlet relay state (add 0 creates the entry without clobbering a run in progress)
scoreboard players add #chain bacapfel_gaunt 0
scoreboard players add #timer bacapfel_gaunt 0
scoreboard players add #dow bacapfel_gaunt 0
scoreboard players add #dnether bacapfel_gaunt 0
scoreboard players add #dend bacapfel_gaunt 0

# Force every online player through the statistic-mirror seeding on the next medium tick,
# so a reload never lets a lifetime total read as a fresh event. f4_init is written so
# that this reseeding clears only short-lived windows - Barn Raising's block tally is
# created there with 'add 0' and survives.
scoreboard players reset * bacapfel_init
# Weaponry / PvP block (F2). Start every statistic mirror of everyone already online
# from zero, so the first cycle after a reload cannot read a lifetime total as an event.
scoreboard players set #f2players bacapfel_sys 0
execute as @a run function bacapfel:detect/f2_init
scoreboard players set #n bacapfel_n 0
scoreboard players set #need bacapfel_n 0
scoreboard players set #ray bacapfel_n 0
scoreboard players set #c bacapfel_wave 0
scoreboard players set #t bacapfel_wave -1
scoreboard players set #ponder bacapfel_horn 0
scoreboard players set #sing bacapfel_horn 0
scoreboard players set #seek bacapfel_horn 0
scoreboard players set #feel bacapfel_horn 0
scoreboard players set #admire bacapfel_horn 0
scoreboard players set #call bacapfel_horn 0
scoreboard players set #yearn bacapfel_horn 0
scoreboard players set #dream bacapfel_horn 0
scoreboard players set #sum bacapfel_horn 0
scoreboard players set #timer bacapfel_horn -1
# Seed every statistic mirror so the first comparison after a reload cannot
# read a lifetime total as a fresh event.
execute as @a run scoreboard players operation @s bacapfel_jumpp = @s bacapfel_jump
execute as @a run scoreboard players operation @s bacapfel_sleepp = @s bacapfel_sleep
execute as @a run scoreboard players operation @s bacapfel_ghornp = @s bacapfel_ghorn
execute as @a run scoreboard players operation @s bacapfel_dropp = @s bacapfel_drop
