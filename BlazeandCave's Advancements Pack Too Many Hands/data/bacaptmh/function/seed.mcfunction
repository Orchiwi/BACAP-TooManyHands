# Every per-player mirror and flag is seeded HERE, before any detector runs.
# These calls used to sit inside the dispatch buckets, which meant a detector
# could run first: on a player whose mirror was still unset,
# `unless score @s <stat> = @s <mirror>` is true, so the detector fired and read
# a whole lifetime statistic as one fresh event. Each line is self-gating, so
# this costs one failed score check per player per tick once seeded.
execute as @a[gamemode=!spectator] unless score @s bacaptmh_f2init matches 1 run function bacaptmh:detect/f2_init
execute as @a unless score @s bacaptmh_init matches 1 run function bacaptmh:detect/f4_init
# --- expansion seeding ---
execute as @a unless score @s bacaptmh_mcp matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_mc 0
execute as @a unless score @s bacaptmh_mcp matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_mcp = @s bacaptmh_mc
execute as @a unless score @s bacaptmh_bbd matches -2147483648..2147483647 run scoreboard players set @s bacaptmh_bbd 0
# --- mp5 seeding. Every mirror below is created HERE, before any detector runs, so a
# detector can never read a lifetime statistic as a fresh event. Each line is self-gating,
# so once a player is seeded this costs one failed score check per player per tick.
execute as @a unless score @s bacaptmh_ndts matches 1 run scoreboard players set @s bacaptmh_ndtd 0
execute as @a unless score @s bacaptmh_ndts matches 1 run scoreboard players set @s bacaptmh_ndts 1
execute as @a unless score @s bacaptmh_gravm matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_grav 0
execute as @a unless score @s bacaptmh_gravm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_gravm = @s bacaptmh_grav
execute as @a unless score @s bacaptmh_sdrm matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_splash 0
execute as @a unless score @s bacaptmh_sdrm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_sdrm = @s bacaptmh_splash
execute as @a unless score @s bacaptmh_fire matches -2147483648..2147483647 store result score @s bacaptmh_fire run data get entity @s Fire
execute as @a unless score @s bacaptmh_firep matches -2147483648..2147483647 store result score @s bacaptmh_firep run data get entity @s Fire
execute as @a[gamemode=!spectator] unless score @s bacaptmh_boatm matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_boat 0
execute as @a[gamemode=!spectator] unless score @s bacaptmh_boatm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_boatm = @s bacaptmh_boat
execute as @a unless score @s bacaptmh_ferry matches -2147483648..2147483647 run scoreboard players set @s bacaptmh_ferry 0
execute as @a unless score @s bacaptmh_tbfdc matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_tbfdc 0
execute as @a unless score @s bacaptmh_tbfd matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_tbfd = @s bacaptmh_tbfdc
execute as @a unless score @s bacaptmh_fire matches -2147483648..2147483647 run scoreboard players set @s bacaptmh_fire 0
execute as @a unless score @s bacaptmh_bcprev matches -2147483648..2147483647 run scoreboard players set @s bacaptmh_bcprev 0
# ---- batch mp1 seeding. Runs before every detector. Every line is self-gating, so once a
# player has been seen this costs one failed score test per player per tick. Each statistic
# has its OWN private mirror; no two mp1 advancements share a delta.
execute as @a unless score @s bacaptmh_m1shelfm matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_m1shelf 0
execute as @a unless score @s bacaptmh_m1shelfm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_m1shelfm = @s bacaptmh_m1shelf
execute as @a unless score @s bacaptmh_m1splashm matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_m1splash 0
execute as @a unless score @s bacaptmh_m1splashm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_m1splashm = @s bacaptmh_m1splash
execute as @a unless score @s bacaptmh_m1ghm matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_m1gh 0
execute as @a unless score @s bacaptmh_m1ghm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_m1ghm = @s bacaptmh_m1gh
# The health mirror is seeded only once the vanilla health objective actually holds a value
# for this player; until then the line just retries, so the first delta can never be
# health-minus-zero and hand Triage a free grant on somebody's login tick.
execute as @a unless score @s bacaptmh_m1hpm matches -2147483648..2147483647 if score @s bacaptmh_m1hp matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_m1hpm = @s bacaptmh_m1hp
# One-shot per player: windows and tallies start closed, and bacaptmh_m1dth - a deathCount
# objective private to this batch - is cleared once, or a player joining with a lifetime
# death total would have those old deaths read as a fresh death by Dying Wish.
execute as @a unless score @s bacaptmh_m1seed matches 1 run scoreboard players set @s bacaptmh_m1blimp 0
execute as @a unless score @s bacaptmh_m1seed matches 1 run scoreboard players set @s bacaptmh_m1emp 0
execute as @a unless score @s bacaptmh_m1seed matches 1 run scoreboard players set @s bacaptmh_m1dth 0
execute as @a unless score @s bacaptmh_m1seed matches 1 run scoreboard players set @s bacaptmh_m1seed 1
# mp2: the two new statistic mirrors are seeded HERE, before any detector runs. Each line is
# self-gating on its own mirror being unset, so this costs one failed score check per player
# per tick once seeded, and a detector can never read a lifetime total as a fresh event.
execute as @a unless score @s bacaptmh_nautp matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_naut 0
execute as @a unless score @s bacaptmh_nautp matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_nautp = @s bacaptmh_naut
execute as @a unless score @s bacaptmh_dtkp matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_dtk 0
execute as @a unless score @s bacaptmh_dtkp matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_dtkp = @s bacaptmh_dtk
# --- Too Many Hands batch mp3 -------------------------------------------------------
# Every statistic mirror this batch adds is seeded HERE, before any bucket runs, and each
# line is self-gating on bacaptmh_b3i. A detector that ran before its mirror was seeded
# would read a whole lifetime statistic as one fresh event. start_extra clears the flag on
# every reload, so the mirrors re-sync instead of going stale across a /reload.
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players add @s bacaptmh_trid 0
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players operation @s bacaptmh_tridm = @s bacaptmh_trid
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players add @s bacaptmh_ms 0
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players add @s bacaptmh_md 0
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players add @s bacaptmh_mt 0
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players operation @s bacaptmh_mn = @s bacaptmh_ms
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players operation @s bacaptmh_mn += @s bacaptmh_md
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players operation @s bacaptmh_mn += @s bacaptmh_mt
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players operation @s bacaptmh_mnm = @s bacaptmh_mn
# Short-lived windows only. bacaptmh_armax / arx / arz / art are the one long-lived run in
# this batch and are deliberately NOT touched here, so a reload cannot wipe a 5000-block leg.
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players set @s bacaptmh_tvn 0
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players set @s bacaptmh_tvt 0
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players set @s bacaptmh_vmt 0
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players set @s bacaptmh_sct 0
execute as @a unless score @s bacaptmh_b3i matches 1 run scoreboard players set @s bacaptmh_b3i 1
# --- batch mp7 statistic mirrors ---------------------------------------------------
# Each pair is self-gating on its own mirror being unset, so it costs one failed score
# check per player per tick once seeded, and a detector can never run before its mirror
# exists and read a lifetime total as one window's worth of travel or trading.
execute as @a unless score @s bacaptmh_boatm matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_boat 0
execute as @a unless score @s bacaptmh_boatm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_boatm = @s bacaptmh_boat
execute as @a unless score @s bacaptmh_hgm matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_hg 0
execute as @a unless score @s bacaptmh_hgm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_hgm = @s bacaptmh_hg
execute as @a unless score @s bacaptmh_tradem matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_trade 0
execute as @a unless score @s bacaptmh_tradem matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_tradem = @s bacaptmh_trade
# --- Too Many Hands batch M9 -------------------------------------------------------
# Every M9 statistic mirror is seeded HERE, before any detector runs, and each line is
# self-gating on bacaptmh_m9i. A detector that ran first on an unseeded mirror would read
# a whole lifetime statistic as one fresh event. start_extra clears bacaptmh_m9i on every
# reload so this block runs again; nothing long-lived may be cleared here, which is why
# Tunnel Vision's bore tally is created with 'add 0' and not 'set 0'.
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players add @s bacaptmh_hcm 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players operation @s bacaptmh_hcmp = @s bacaptmh_hcm
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players set @s bacaptmh_hcmd 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players add @s bacaptmh_mstone 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players add @s bacaptmh_mdeep 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players operation @s bacaptmh_borem = @s bacaptmh_mstone
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players operation @s bacaptmh_borem += @s bacaptmh_mdeep
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players set @s bacaptmh_bored 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players add @s bacaptmh_bore 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players add @s bacaptmh_kwither 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players operation @s bacaptmh_kwitherp = @s bacaptmh_kwither
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players add @s bacaptmh_kwarden 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players operation @s bacaptmh_kwardenp = @s bacaptmh_kwarden
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players add @s bacaptmh_kdragon 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players operation @s bacaptmh_kdragonp = @s bacaptmh_kdragon
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players set @s bacaptmh_void 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players set @s bacaptmh_ns 0
execute as @a unless score @s bacaptmh_m9i matches 1 run scoreboard players set @s bacaptmh_m9i 1
# --- mp8 seeding. Every mirror and window below is created before any mp8 detector
# runs, and every line is self-gating, so this costs one failed check per player per
# tick once seeded. Nothing here CLEARS a live tally: the two statistic mirrors are
# only written when they have no value at all, and every counter is created with
# 'add 0', which materialises the entry at its current value and never clobbers a
# sparring run or an escort in progress across a /reload.
execute as @a unless score @s bacaptmh_walkm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_walkm = @s bacaptmh_walk
execute as @a unless score @s bacaptmh_sprtm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_sprtm = @s bacaptmh_sprt
execute as @a run scoreboard players add @s bacaptmh_walkd 0
execute as @a run scoreboard players add @s bacaptmh_sprtd 0
execute as @a run scoreboard players add @s bacaptmh_esc 0
execute as @a run scoreboard players add @s bacaptmh_cs 0
execute as @a run scoreboard players add @s bacaptmh_dup 0
execute as @a run scoreboard players add @s bacaptmh_sm 0
execute as @a run scoreboard players add @s bacaptmh_sp_h 0
execute as @a run scoreboard players add @s bacaptmh_sp_t 0
execute as @a run scoreboard players add @s bacaptmh_sp_d 0
execute as @a unless score @s bacaptmh_gapple_m matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_gapple 0
execute as @a unless score @s bacaptmh_gapple_m matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_gapple_m = @s bacaptmh_gapple
# mp11 statistic mirrors. Self-gating, so each costs one failed score check per player
# per tick once seeded, and no detector below can ever read a lifetime total as an event.
execute as @a unless score @s bacaptmh_walkm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_walkm = @s bacaptmh_walk
execute as @a unless score @s bacaptmh_sprm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_sprm = @s bacaptmh_sprint
execute as @a unless score @s bacaptmh_hurtm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_hurtm = @s bacaptmh_hurt
execute as @a unless score @s bacaptmh_repm matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_repm = @s bacaptmh_rep
execute as @a[gamemode=!spectator] unless score @s bacaptmh_mp10 matches 1 run scoreboard players add @s bacaptmh_xpb 0
execute as @a[gamemode=!spectator] unless score @s bacaptmh_mp10 matches 1 run scoreboard players operation @s bacaptmh_xpb_m = @s bacaptmh_xpb
execute as @a[gamemode=!spectator] unless score @s bacaptmh_mp10 matches 1 run scoreboard players add @s bacaptmh_gmc 0
execute as @a[gamemode=!spectator] unless score @s bacaptmh_mp10 matches 1 run scoreboard players add @s bacaptmh_gmb 0
execute as @a[gamemode=!spectator] unless score @s bacaptmh_mp10 matches 1 run scoreboard players add @s bacaptmh_gmw 0
execute as @a[gamemode=!spectator] unless score @s bacaptmh_mp10 matches 1 run scoreboard players set @s bacaptmh_arw 0
execute as @a[gamemode=!spectator] unless score @s bacaptmh_mp10 matches 1 run scoreboard players set @s bacaptmh_mp10 1
# Batch MP13 - every private statistic mirror and window is created HERE, before any detector
# runs, so a detector can never read a lifetime statistic as one fresh event. Each line is
# self-gating on bacaptmh_m13, so once seeded it costs one failed score check per player.
# Bread Winner's tally is created with 'add 0', never 'set 0', so re-seeding on /reload
# cannot wipe a run in progress - the Barn Raising convention.
execute as @a unless score @s bacaptmh_m13 matches 1 run scoreboard players add @s bacaptmh_swim 0
execute as @a unless score @s bacaptmh_m13 matches 1 run scoreboard players operation @s bacaptmh_swimm = @s bacaptmh_swim
execute as @a unless score @s bacaptmh_m13 matches 1 run scoreboard players add @s bacaptmh_slp2 0
execute as @a unless score @s bacaptmh_m13 matches 1 run scoreboard players operation @s bacaptmh_bunkm = @s bacaptmh_slp2
execute as @a unless score @s bacaptmh_m13 matches 1 run scoreboard players add @s bacaptmh_fed 0
execute as @a unless score @s bacaptmh_m13 matches 1 run scoreboard players set @s bacaptmh_bunk 0
execute as @a unless score @s bacaptmh_m13 matches 1 run scoreboard players set @s bacaptmh_hp13 0
execute as @a unless score @s bacaptmh_m13 matches 1 run scoreboard players set @s bacaptmh_sacn 0
execute as @a unless score @s bacaptmh_m13 matches 1 run scoreboard players set @s bacaptmh_sac -1
execute as @a unless score @s bacaptmh_m13 matches 1 run scoreboard players set @s bacaptmh_m13 1
# mp14: seed the ender-pearl mirror the first time this pack sees a player, so a lifetime
# used:ender_pearl total is never read as a throw that just happened. Self-gating on the
# mirror being unset, so it costs one failed score check per player per tick once seeded.
execute as @a unless score @s bacaptmh_pearlp matches -2147483648..2147483647 run scoreboard players add @s bacaptmh_pearl 0
execute as @a unless score @s bacaptmh_pearlp matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_pearlp = @s bacaptmh_pearl
# mp14: seed the experience mirror to the player's real point total, NOT to zero - zero
# would make the very first sample look like they had just picked up their whole balance.
execute as @a unless score @s bacaptmh_xpn matches -2147483648..2147483647 store result score @s bacaptmh_xpn run experience query @s points
# mp14: zero this pack's private death counter before the death window objective exists,
# so the ordering below can never let a lifetime deathCount through as a fresh death.
execute as @a unless score @s bacaptmh_tw matches -2147483648..2147483647 run scoreboard players set @s bacaptmh_dcount 0
execute as @a unless score @s bacaptmh_tw matches -2147483648..2147483647 run scoreboard players set @s bacaptmh_tw 0
# --- expansion seeding ---
execute as @a unless score @s bacaptmh_bcd matches -2147483648..2147483647 run scoreboard players set @s bacaptmh_bcd 0
