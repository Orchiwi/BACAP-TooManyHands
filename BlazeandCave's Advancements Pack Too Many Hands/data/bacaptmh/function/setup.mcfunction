# Raise command limits, matching what BACAP and Enhanced Discoveries do
execute in minecraft:overworld run gamerule max_command_forks 999999999
execute in minecraft:the_nether run gamerule max_command_forks 999999999
execute in minecraft:the_end run gamerule max_command_forks 999999999
execute in minecraft:overworld run gamerule max_command_sequence_length 999999999
execute in minecraft:the_nether run gamerule max_command_sequence_length 999999999
execute in minecraft:the_end run gamerule max_command_sequence_length 999999999

scoreboard objectives add bacaptmh_sys dummy
scoreboard objectives add bacaptmh_tmp dummy
scoreboard objectives add bacaptmh_dmg minecraft.custom:minecraft.damage_dealt
scoreboard objectives add bacaptmh_dmgp dummy
scoreboard objectives add bacaptmh_dmgd dummy
scoreboard objectives add bacaptmh_dmgt dummy
scoreboard objectives add bacaptmh_dgt dummy
scoreboard objectives add bacaptmh_cart minecraft.custom:minecraft.minecart_one_cm
scoreboard objectives add bacaptmh_cartp dummy
scoreboard objectives add bacaptmh_cartd dummy
scoreboard objectives add bacaptmh_deaths deathCount
scoreboard objectives add bacaptmh_dtime dummy
scoreboard objectives add bacaptmh_tmp4 dummy
scoreboard objectives add bacaptmh_init dummy
scoreboard objectives add bacaptmh_splash minecraft.used:minecraft.splash_potion
scoreboard objectives add bacaptmh_splash_m dummy
scoreboard objectives add bacaptmh_medic dummy
scoreboard objectives add bacaptmh_lpot minecraft.used:minecraft.lingering_potion
scoreboard objectives add bacaptmh_lpot_m dummy
scoreboard objectives add bacaptmh_ling dummy
scoreboard objectives add bacaptmh_gas dummy
scoreboard objectives add bacaptmh_gb dummy
scoreboard objectives add bacaptmh_gbm dummy
scoreboard objectives add bacaptmh_barn dummy
scoreboard objectives add bacaptmh_cx dummy
scoreboard objectives add bacaptmh_cz dummy
scoreboard objectives add bacaptmh_cd dummy
scoreboard objectives add bacaptmh_wbucket minecraft.used:minecraft.water_bucket
scoreboard objectives add bacaptmh_wbucket_m dummy
scoreboard objectives add bacaptmh_wt dummy
scoreboard objectives add bacaptmh_fall dummy
scoreboard objectives add bacaptmh_tchest minecraft.used:minecraft.trapped_chest
scoreboard objectives add bacaptmh_tchest_m dummy
scoreboard objectives add bacaptmh_tct dummy
scoreboard objectives add bacaptmh_fw minecraft.used:minecraft.firework_rocket
scoreboard objectives add bacaptmh_fw_m dummy
scoreboard objectives add bacaptmh_fwt dummy
scoreboard objectives add bacaptmh_dim dummy
scoreboard objectives add bacaptmh_pt dummy
scoreboard objectives add bacaptmh_totem minecraft.used:minecraft.totem_of_undying
scoreboard objectives add bacaptmh_totem_m dummy
scoreboard objectives add bacaptmh_tott dummy
scoreboard objectives add bacaptmh_gaunt dummy
scoreboard objectives add bacaptmh_dd dummy
scoreboard objectives add bacaptmh_y dummy
scoreboard objectives add bacaptmh_form dummy
scoreboard objectives add bacaptmh_pkill playerKillCount
scoreboard objectives add bacaptmh_death deathCount
scoreboard objectives add bacaptmh_blocked minecraft.custom:minecraft.damage_blocked_by_shield
scoreboard objectives add bacaptmh_ekill dummy
scoreboard objectives add bacaptmh_edeath dummy
scoreboard objectives add bacaptmh_eblock dummy
scoreboard objectives add bacaptmh_f2init dummy
scoreboard objectives add bacaptmh_pid dummy
scoreboard objectives add bacaptmh_sb_timer dummy
scoreboard objectives add bacaptmh_sb_count dummy
scoreboard objectives add bacaptmh_sb_v1 dummy
scoreboard objectives add bacaptmh_sb_v2 dummy
scoreboard objectives add bacaptmh_sb_v3 dummy
scoreboard objectives add bacaptmh_armed dummy
scoreboard objectives add bacaptmh_anvilv dummy
scoreboard objectives add bacaptmh_anvfrom dummy
scoreboard objectives add bacaptmh_sw_near dummy
scoreboard objectives add bacaptmh_wd_timer dummy
scoreboard objectives add bacaptmh_wd_base dummy
scoreboard objectives add bacaptmh_wd_now dummy
scoreboard objectives add bacaptmh_wd_from dummy
scoreboard objectives add bacaptmh_tt_win dummy
scoreboard objectives add bacaptmh_n dummy
scoreboard objectives add bacaptmh_a1_give dummy
scoreboard objectives add bacaptmh_a1_get dummy
scoreboard objectives add bacaptmh_a2_give dummy
scoreboard objectives add bacaptmh_a2_get dummy
scoreboard objectives add bacaptmh_a3_give dummy
scoreboard objectives add bacaptmh_a3_get dummy
scoreboard objectives add bacaptmh_drop minecraft.custom:minecraft.drop
scoreboard objectives add bacaptmh_dropp dummy
scoreboard objectives add bacaptmh_toss dummy
scoreboard objectives add bacaptmh_alone dummy
scoreboard objectives add bacaptmh_far dummy
scoreboard objectives add bacaptmh_wave dummy
scoreboard objectives add bacaptmh_jump minecraft.custom:minecraft.jump
scoreboard objectives add bacaptmh_jumpp dummy
scoreboard objectives add bacaptmh_dye dummy
scoreboard objectives add bacaptmh_dress_m dummy
scoreboard objectives add bacaptmh_dress_t dummy
scoreboard objectives add bacaptmh_nap dummy
scoreboard objectives add bacaptmh_sleep minecraft.custom:minecraft.sleep_in_bed
scoreboard objectives add bacaptmh_sleepp dummy
scoreboard objectives add bacaptmh_vault dummy
scoreboard objectives add bacaptmh_horn dummy
scoreboard objectives add bacaptmh_ghorn minecraft.used:minecraft.goat_horn
scoreboard objectives add bacaptmh_ghornp dummy
scoreboard objectives add bacaptmh_owner dummy

# The Gauntlet relay state (add 0 creates the entry without clobbering a run in progress)
scoreboard players add #chain bacaptmh_gaunt 0
scoreboard players add #timer bacaptmh_gaunt 0
scoreboard players add #dow bacaptmh_gaunt 0
scoreboard players add #dnether bacaptmh_gaunt 0
scoreboard players add #dend bacaptmh_gaunt 0

# Force every online player through the statistic-mirror seeding on the next medium tick,
# so a reload never lets a lifetime total read as a fresh event. f4_init is written so
# that this reseeding clears only short-lived windows - Barn Raising's block tally is
# created there with 'add 0' and survives.
scoreboard players reset * bacaptmh_init
# Weaponry / PvP block (F2). Start every statistic mirror of everyone already online
# from zero, so the first cycle after a reload cannot read a lifetime total as an event.
scoreboard players set #f2players bacaptmh_sys 0
execute as @a run function bacaptmh:detect/f2_init
scoreboard players set #n bacaptmh_n 0
scoreboard players set #need bacaptmh_n 0
scoreboard players set #ray bacaptmh_n 0
scoreboard players set #c bacaptmh_wave 0
scoreboard players set #t bacaptmh_wave -1
scoreboard players set #ponder bacaptmh_horn 0
scoreboard players set #sing bacaptmh_horn 0
scoreboard players set #seek bacaptmh_horn 0
scoreboard players set #feel bacaptmh_horn 0
scoreboard players set #admire bacaptmh_horn 0
scoreboard players set #call bacaptmh_horn 0
scoreboard players set #yearn bacaptmh_horn 0
scoreboard players set #dream bacaptmh_horn 0
scoreboard players set #sum bacaptmh_horn 0
scoreboard players set #timer bacaptmh_horn -1
# Seed every statistic mirror so the first comparison after a reload cannot
# read a lifetime total as a fresh event.
execute as @a run scoreboard players operation @s bacaptmh_jumpp = @s bacaptmh_jump
execute as @a run scoreboard players operation @s bacaptmh_sleepp = @s bacaptmh_sleep
execute as @a run scoreboard players operation @s bacaptmh_ghornp = @s bacaptmh_ghorn
execute as @a run scoreboard players operation @s bacaptmh_dropp = @s bacaptmh_drop
