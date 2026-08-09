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
execute if score #players bacaptmh_sys matches 3.. as @a[gamemode=!spectator,advancements={bacaptmh:challenges/warden_party=false}] at @s if entity @e[type=warden,distance=..16] run function bacaptmh:detect/warden_party
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
execute if score #players bacaptmh_sys matches 3.. if entity @a[advancements={bacaptmh:end/formation_flying=false},limit=1] run function bacaptmh:detect/formation_flying
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
execute as @a[gamemode=!spectator,advancements={bacaptmh:animal/shared_custody={named=true,guard=false}}] at @s run function bacaptmh:detect/custody_name
execute as @a[gamemode=!spectator,advancements={bacaptmh:animal/shared_custody={fed=true,guard=false}}] at @s run function bacaptmh:detect/custody_feed
# --- expansion ---
# --- Too Many Hands batch MP6 ------------------------------------------------------
# Online players are COUNTED into a fake player of this batch's own; 'if entity @a[limit=N]'
# only ever asks whether at least one player matched, so it guards nothing.
scoreboard players set #mp6players bacaptmh_mp6 0
execute as @a[gamemode=!spectator] run scoreboard players add #mp6players bacaptmh_mp6 1
# MP6's own minecart_one_cm delta. Its mirror is seeded in bacaptmh:seed, never here, so
# a detector can never run before the mirror exists and read a lifetime total as an event.
execute as @a run scoreboard players operation @s bacaptmh_mcd = @s bacaptmh_mc
execute as @a run scoreboard players operation @s bacaptmh_mcd -= @s bacaptmh_mcp
execute as @a run scoreboard players operation @s bacaptmh_mcp = @s bacaptmh_mc
# Gallery Opening - age the one-minute window first, then let anyone who just hung a
# painting look around. Deliberately NOT gated on the player count: a latched criterion
# must be consumed on the next pass, or it could sit around and pair with a painting hung
# days later. gamemode=!creative because this measures block placement.
execute as @a[scores={bacaptmh_gal=1..}] run scoreboard players remove @s bacaptmh_gal 1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:building/gallery_opening={hung=true,impossible=false}}] at @s run function bacaptmh:detect/gallery_opening
# Emergency Exit - age the five-second portal window and drop the health flag with it.
execute as @a[scores={bacaptmh_exit=1..}] run scoreboard players remove @s bacaptmh_exit 1
scoreboard players set @a[scores={bacaptmh_exit=0}] bacaptmh_ehurt 0
execute as @a[gamemode=!spectator,advancements={bacaptmh:nether/emergency_exit={escaped=true,impossible=false}}] at @s run function bacaptmh:detect/emergency_exit
# Mind the Gap - runs after the cart delta above, so the delta covers the same half-second
# the rail went down in. gamemode=!creative because this measures block placement.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:redstone/mind_the_gap={laid_track=true,impossible=false}}] at @s run function bacaptmh:detect/mind_the_gap
# Blood Brothers - a death opens a twenty-second window (40 medium ticks). bacaptmh_bbd is
# a private deathCount objective, consumed here every pass so it can never leak, and it
# ticks up whether or not the death screen is shown, so this works with doImmediateRespawn.
execute as @a[gamemode=!spectator] if score @s bacaptmh_bbd matches 1.. run scoreboard players set @s bacaptmh_bb 41
execute as @a run scoreboard players set @s bacaptmh_bbd 0
execute as @a[scores={bacaptmh_bb=1..}] run scoreboard players remove @s bacaptmh_bb 1
execute if score #mp6players bacaptmh_mp6 matches 4.. as @a[gamemode=!spectator,advancements={bacaptmh:nether/blood_brothers=false},scores={bacaptmh_bb=1..},nbt=!{Health:0.0f}] at @s if dimension minecraft:the_nether run function bacaptmh:detect/blood_brothers
# --- mp5 -------------------------------------------------------------------------
# Both of these are called UNGATED: each maintains statistic mirrors that must not freeze.
# Their internal grants carry their own '#players matches 2..' gate.
function bacaptmh:detect/dig_me_out
function bacaptmh:detect/stop_drop_and_roll
execute if score #players bacaptmh_sys matches 2.. if entity @a[gamemode=!spectator,advancements={bacaptmh:monsters/night_watch=false},limit=1] run function bacaptmh:detect/night_watch
# --- Too Many Hands batch mp4 -------------------------------------------------------
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:adventure/starter_kit=false}] at @s run function bacaptmh:detect/starter_kit
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:biomes/ferrymans_fee=false}] at @s run function bacaptmh:detect/ferrymans_fee
# Trial by Fire: the burning flag is read for EVERY non-spectator, never behind the per-player
# advancement gate, so a veteran still counts towards somebody else's three and no player can
# come back to a stale value. 'data get' failing simply stores 0, which reads as 'not burning'.
execute if entity @a[advancements={bacaptmh:monsters/trial_by_fire=false},limit=1] run scoreboard players set @a[gamemode=!spectator] bacaptmh_fire 0
execute if entity @a[advancements={bacaptmh:monsters/trial_by_fire=false},limit=1] as @a[gamemode=!spectator] store result score @s bacaptmh_fire run data get entity @s Fire
scoreboard players remove @a[scores={bacaptmh_tbf=1..}] bacaptmh_tbf 1
execute if score #players bacaptmh_sys matches 3.. as @a[gamemode=!spectator,advancements={bacaptmh:monsters/trial_by_fire=false}] at @s run function bacaptmh:detect/trial_by_fire
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:redstone/bumper_carts=false}] at @s run function bacaptmh:detect/bumper_carts
# Bumper Carts' previous-window mirror is refreshed here, AFTER the detector and ungated, so
# both riders are still holding last window's delta while the check runs.
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_bcprev = @s bacaptmh_cartd
# ================= batch mp1 =================
# ---- Read the Room (enchanting). Age the stacking window, open a new one on a bookshelf
# placement, then refresh the mirror UNGATED so it can never go stale behind a closed gate.
execute as @a[scores={bacaptmh_m1shelfw=1..}] run scoreboard players remove @s bacaptmh_m1shelfw 1
execute as @a[gamemode=!spectator,gamemode=!creative] if score @s bacaptmh_m1shelf > @s bacaptmh_m1shelfm run scoreboard players set @s bacaptmh_m1shelfw 240
execute as @a run scoreboard players operation @s bacaptmh_m1shelfm = @s bacaptmh_m1shelf
# The nearby stocker is only half the test - the shelves themselves have to be at the table,
# not merely somewhere in the world. detect/read_the_room sweeps for them and grants both.
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:enchanting/read_the_room={enchanted=true,impossible=false}}] at @s if entity @a[distance=1..16,gamemode=!spectator,scores={bacaptmh_m1shelfw=1..}] run function bacaptmh:detect/read_the_room
execute as @a[advancements={bacaptmh:enchanting/read_the_room={enchanted=true,impossible=false}}] run advancement revoke @s only bacaptmh:enchanting/read_the_room enchanted
# ---- Up and Away (end). 20 medium ticks is ten seconds, exactly a Shulker bullet's
# levitation; effects_changed re-fires on re-application, so a second hit refreshes it.
execute as @a[scores={bacaptmh_m1lev=1..}] run scoreboard players remove @s bacaptmh_m1lev 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:end/up_and_away={levitating=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1lev 20
execute as @a[advancements={bacaptmh:end/up_and_away={levitating=true,impossible=false}}] run advancement revoke @s only bacaptmh:end/up_and_away levitating
# The count is anchored on one of the levitating players, the way firework_finale is: an
# unanchored @a count paid out for three players levitating in three different dimensions.
execute if score #players bacaptmh_sys matches 3.. as @a[gamemode=!spectator,scores={bacaptmh_m1lev=1..},advancements={bacaptmh:end/up_and_away=false}] at @s run function bacaptmh:detect/up_and_away
# ---- Potluck (farming). Six windows age first, then each food family opens its own window
# plus the shared eater window and has its hook cleared on the same pass.
execute as @a[scores={bacaptmh_m1pa=1..}] run scoreboard players remove @s bacaptmh_m1pa 1
execute as @a[scores={bacaptmh_m1p1=1..}] run scoreboard players remove @s bacaptmh_m1p1 1
execute as @a[scores={bacaptmh_m1p2=1..}] run scoreboard players remove @s bacaptmh_m1p2 1
execute as @a[scores={bacaptmh_m1p3=1..}] run scoreboard players remove @s bacaptmh_m1p3 1
execute as @a[scores={bacaptmh_m1p4=1..}] run scoreboard players remove @s bacaptmh_m1p4 1
execute as @a[scores={bacaptmh_m1p5=1..}] run scoreboard players remove @s bacaptmh_m1p5 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:farming/potluck={f1=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1p1 20
execute as @a[gamemode=!spectator,advancements={bacaptmh:farming/potluck={f1=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1pa 20
execute as @a[advancements={bacaptmh:farming/potluck={f1=true,impossible=false}}] run advancement revoke @s only bacaptmh:farming/potluck f1
execute as @a[gamemode=!spectator,advancements={bacaptmh:farming/potluck={f2=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1p2 20
execute as @a[gamemode=!spectator,advancements={bacaptmh:farming/potluck={f2=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1pa 20
execute as @a[advancements={bacaptmh:farming/potluck={f2=true,impossible=false}}] run advancement revoke @s only bacaptmh:farming/potluck f2
execute as @a[gamemode=!spectator,advancements={bacaptmh:farming/potluck={f3=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1p3 20
execute as @a[gamemode=!spectator,advancements={bacaptmh:farming/potluck={f3=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1pa 20
execute as @a[advancements={bacaptmh:farming/potluck={f3=true,impossible=false}}] run advancement revoke @s only bacaptmh:farming/potluck f3
execute as @a[gamemode=!spectator,advancements={bacaptmh:farming/potluck={f4=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1p4 20
execute as @a[gamemode=!spectator,advancements={bacaptmh:farming/potluck={f4=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1pa 20
execute as @a[advancements={bacaptmh:farming/potluck={f4=true,impossible=false}}] run advancement revoke @s only bacaptmh:farming/potluck f4
execute as @a[gamemode=!spectator,advancements={bacaptmh:farming/potluck={f5=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1p5 20
execute as @a[gamemode=!spectator,advancements={bacaptmh:farming/potluck={f5=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1pa 20
execute as @a[advancements={bacaptmh:farming/potluck={f5=true,impossible=false}}] run advancement revoke @s only bacaptmh:farming/potluck f5
execute as @a[gamemode=!spectator,scores={bacaptmh_m1pa=1..},advancements={bacaptmh:farming/potluck=false}] at @s run function bacaptmh:detect/m1_potluck
# ---- Hold the Line (monsters). 10 medium ticks is five seconds. distance=1..24 from the
# finisher excludes the finisher, so one player who both blocked and killed gets nothing.
execute as @a[scores={bacaptmh_m1htl=1..}] run scoreboard players remove @s bacaptmh_m1htl 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/hold_the_line={blocked=true,impossible=false}}] run scoreboard players set @s bacaptmh_m1htl 10
execute as @a[advancements={bacaptmh:monsters/hold_the_line={blocked=true,impossible=false}}] run advancement revoke @s only bacaptmh:monsters/hold_the_line blocked
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/hold_the_line={slew=true,impossible=false}}] at @s run advancement grant @a[distance=1..24,gamemode=!spectator,scores={bacaptmh_m1htl=1..}] only bacaptmh:monsters/hold_the_line
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/hold_the_line={slew=true,impossible=false}}] at @s if entity @a[distance=1..24,gamemode=!spectator,scores={bacaptmh_m1htl=1..}] run advancement grant @s only bacaptmh:monsters/hold_the_line
execute as @a[advancements={bacaptmh:monsters/hold_the_line={slew=true,impossible=false}}] run advancement revoke @s only bacaptmh:monsters/hold_the_line slew
# ---- Blimpin' Ain't Easy (statistics). Delta first, then the mirror, then the detector,
# which consumes bacaptmh_m1ghd. The mirror line is ungated so it cannot freeze.
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_m1ghd = @s bacaptmh_m1gh
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_m1ghd -= @s bacaptmh_m1ghm
execute as @a run scoreboard players operation @s bacaptmh_m1ghm = @s bacaptmh_m1gh
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:statistics/blimpin_aint_easy=false}] at @s run function bacaptmh:detect/m1_blimp
# ---- Guest Room (adventure). 600 medium ticks is five minutes of hospitality.
execute as @a[scores={bacaptmh_m1bed=1..}] run scoreboard players remove @s bacaptmh_m1bed 1
# ---- Dying Wish (adventure). 30 medium ticks is fifteen seconds. The empty-inventory
# counter is capped at ten. Dying also empties the inventory, so the counter is only 1 on
# the first pass after such a death - and the death mirror is consumed on that same pass,
# so a player who died holding his gear gets exactly one chance and fails it.
execute as @a[scores={bacaptmh_m1dw=1..}] run scoreboard players remove @s bacaptmh_m1dw 1
execute as @a[gamemode=!spectator] if data entity @s Inventory[0] run scoreboard players set @s bacaptmh_m1emp 0
execute as @a[gamemode=!spectator,scores={bacaptmh_m1emp=..9}] unless data entity @s Inventory[0] run scoreboard players add @s bacaptmh_m1emp 1
execute as @a[scores={bacaptmh_m1dth=1..}] run scoreboard players set @s bacaptmh_m1dth 0
# ---- Pay It Forward (adventure). 60 medium ticks is thirty seconds.
execute as @a[scores={bacaptmh_m1tot=1..}] run scoreboard players remove @s bacaptmh_m1tot 1
# ---- Triage (potion). Splash window first, then the health delta, then the detector, and
# only THEN the health mirror - the detector reads bacaptmh_m1hpm as 'health before'.
execute as @a[scores={bacaptmh_m1splashw=1..}] run scoreboard players remove @s bacaptmh_m1splashw 1
execute as @a[gamemode=!spectator] if score @s bacaptmh_m1splash > @s bacaptmh_m1splashm run scoreboard players set @s bacaptmh_m1splashw 2
execute as @a run scoreboard players operation @s bacaptmh_m1splashm = @s bacaptmh_m1splash
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_m1hpd = @s bacaptmh_m1hp
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_m1hpd -= @s bacaptmh_m1hpm
execute as @a[gamemode=!spectator,scores={bacaptmh_m1splashw=1..},advancements={bacaptmh:potion/triage=false}] at @s run function bacaptmh:detect/m1_triage
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_m1hpm = @s bacaptmh_m1hp
# --- Too Many Hands batch mp2 -------------------------------------------------------
# Statistic mirrors first and UNGATED, so no delta can go stale behind a closed gate and
# no lifetime total can ever be read as one window's worth of movement or damage.
execute as @a run scoreboard players operation @s bacaptmh_nautd = @s bacaptmh_naut
execute as @a run scoreboard players operation @s bacaptmh_nautd -= @s bacaptmh_nautp
execute as @a run scoreboard players operation @s bacaptmh_nautp = @s bacaptmh_naut
execute as @a run scoreboard players operation @s bacaptmh_dtkd = @s bacaptmh_dtk
execute as @a run scoreboard players operation @s bacaptmh_dtkd -= @s bacaptmh_dtkp
execute as @a run scoreboard players operation @s bacaptmh_dtkp = @s bacaptmh_dtk
# Every short-lived window in this batch ages by one medium tick, before anything re-stamps it.
execute as @a[scores={bacaptmh_cst=1..}] run scoreboard players remove @s bacaptmh_cst 1
execute as @a[scores={bacaptmh_stt=1..}] run scoreboard players remove @s bacaptmh_stt 1
execute as @a[scores={bacaptmh_eyt=1..}] run scoreboard players remove @s bacaptmh_eyt 1
# The eye tally has to die with its window, or 'six eyes each' quietly means 'six eyes at
# any point in your life', and a player who filled a portal in a previous stronghold walks
# up already qualified.
execute as @a[scores={bacaptmh_eyt=..0}] run scoreboard players set @s bacaptmh_eye 0
execute as @a[scores={bacaptmh_bounty=1..}] run scoreboard players remove @s bacaptmh_bounty 1
# B1 The Cousteau Manoeuvre - the criterion does the structure, vehicle and fluid test and
# re-arms about every 20 ticks; here it becomes a four-window stamp and is released again.
execute as @a[gamemode=!spectator,advancements={bacaptmh:biomes/the_cousteau_manoeuvre={inside=true,impossible=false}}] run scoreboard players set @s bacaptmh_cst 4
execute as @a[gamemode=!spectator,advancements={bacaptmh:biomes/the_cousteau_manoeuvre={inside=true,impossible=false}}] run advancement revoke @s only bacaptmh:biomes/the_cousteau_manoeuvre inside
execute as @a[scores={bacaptmh_cst=..0}] run scoreboard players set @s bacaptmh_cous 0
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_cst=1..},advancements={bacaptmh:biomes/the_cousteau_manoeuvre=false}] at @s run function bacaptmh:detect/cousteau
# A2 Sting Operation - one function, entered from either flag; a player holding both simply
# runs it twice and the second pass finds nothing left to do.
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:animal/sting_operation={angered=true,impossible=false}}] at @s run function bacaptmh:detect/sting_operation
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:animal/sting_operation={stung=true,impossible=false}}] at @s run function bacaptmh:detect/sting_operation
# E3 Eye Contact
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:end/eye_contact={seated=true,impossible=false}}] at @s run function bacaptmh:detect/eye_contact
# R4 Grand Central
execute if score #players bacaptmh_sys matches 4.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:challenges/grand_central=false}] at @s run function bacaptmh:detect/grand_central
# S5 Crash Test Dummy - the criterion is the attribution; the delta above is the amount.
execute as @a[gamemode=!spectator,advancements={bacaptmh:statistics/crash_test_dummy={hurt=true,impossible=false}}] run function bacaptmh:detect/crash_test_dummy
# W6 Blood Debt - three lines, NO new detection function. bacaptmh_ekill / bacaptmh_edeath are
# stamped ungated by detect/f2_events above from consumed mirrors, so a lifetime playerKillCount
# can never read as a fresh kill. The payout is evaluated BEFORE the new bounty is written, so a
# killer can never collect on the bounty they themselves just earned.
execute if score #f2players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,scores={bacaptmh_ekill=1..},advancements={bacaptmh:weaponry/blood_debt=false}] at @s if entity @a[gamemode=!spectator,scores={bacaptmh_edeath=1..,bacaptmh_bounty=1..},distance=1..64] run advancement grant @s only bacaptmh:weaponry/blood_debt
execute if score #f2players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,scores={bacaptmh_ekill=1..}] at @s if entity @a[gamemode=!spectator,scores={bacaptmh_edeath=1..},distance=1..64] run scoreboard players set @s bacaptmh_bounty 120
# --- Too Many Hands batch mp3 -------------------------------------------------------
execute if score #players bacaptmh_sys matches 2.. if entity @a[gamemode=!spectator,advancements={bacaptmh:mining/tunnel_vision=false},limit=1] as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_b3i=1}] at @s run function bacaptmh:detect/tunnel_vision
# Bomb Disposal - age the victim stamp FIRST, so a stamp written below keeps its full three
# seconds. Dispatched straight onto the Creepers, which only sample who they are hunting;
# the kill itself is a real criterion now, consumed on the same pass so it can never sit
# latched and pair with a Creeper killed days later.
scoreboard players remove @a[scores={bacaptmh_bdv=1..}] bacaptmh_bdv 1
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:monsters/bomb_disposal=false}] at @s as @e[type=creeper,distance=..12,limit=6,sort=nearest] at @s run function bacaptmh:detect/bomb_disposal
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:monsters/bomb_disposal={slew=true,impossible=false}}] at @s run function bacaptmh:detect/bomb_kill
advancement revoke @a[advancements={bacaptmh:monsters/bomb_disposal={slew=true,impossible=false}}] only bacaptmh:monsters/bomb_disposal slew
# --- batch mp7 -------------------------------------------------------------------
# Appended after detect/sample, so #f3now and every statistic mirror and death stamp
# these lines depend on are already current for this window.
scoreboard players operation #b7cut bacaptmh_tmp = #f3now bacaptmh_tmp
scoreboard players remove #b7cut bacaptmh_tmp 12000
scoreboard players set #b7mode bacaptmh_tmp 1
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:adventure/ferryman=false}] run function bacaptmh:detect/ferry
scoreboard players set #b7mode bacaptmh_tmp 2
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:nether/medevac=false}] run function bacaptmh:detect/ferry
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:animal/reservoir_dogs=false}] at @s if entity @e[type=wolf,distance=..24,limit=1] run function bacaptmh:detect/reservoir_dogs
execute if score #players bacaptmh_sys matches 2.. if entity @a[gamemode=!spectator,advancements={bacaptmh:monsters/pincer_movement=false},limit=1] as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_dmgd=1..}] at @s run function bacaptmh:detect/pincer
# --- Too Many Hands batch M9 -------------------------------------------------------
# #players, #f3now and #f3cut1200 are already computed by the block above this one.
# Windows age FIRST, so a window opened later in this same pass survives its full length.
scoreboard players remove @a[scores={bacaptmh_void=1..}] bacaptmh_void 1
scoreboard players remove @a[scores={bacaptmh_ns=1..}] bacaptmh_ns 1
# Movement and mining deltas are computed for EVERY non-spectator and are never gated on
# advancement state, so no mirror can go stale behind a closed gate. Each objective has its
# own private mirror; no two advancements share a delta.
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_hcmd = @s bacaptmh_hcm
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_hcmd -= @s bacaptmh_hcmp
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_hcmp = @s bacaptmh_hcm
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_bored = @s bacaptmh_mstone
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_bored += @s bacaptmh_mdeep
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_bored -= @s bacaptmh_borem
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_borem = @s bacaptmh_mstone
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_borem += @s bacaptmh_mdeep
# M9 Photo Finish - two riders over ten blocks a second within three blocks of each other.
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_hcmd=500..},advancements={bacaptmh:animal/photo_finish=false}] at @s run function bacaptmh:detect/photo_finish
# M9 Tunnel Vision - accumulate the bore, then look for a breakthrough.
# M9 Ashes to Ashes - 'at @s' is required: 'if dimension' tests the execution dimension.
execute if score #players bacaptmh_sys matches 2.. if entity @a[gamemode=!spectator,advancements={bacaptmh:end/ashes_to_ashes=false},limit=1] as @a[gamemode=!spectator,gamemode=!creative] at @s run function bacaptmh:detect/ashes_to_ashes
# M9 Noble Sacrifice - consumes the 'fell' criterion, reads the Wither kill delta.
execute if score #players bacaptmh_sys matches 2.. run function bacaptmh:detect/noble_sacrifice
# M9 The Relay - reads the same Wither delta, plus Warden and Ender Dragon.
execute if score #players bacaptmh_sys matches 3.. if entity @a[gamemode=!spectator,advancements={bacaptmh:challenges/the_relay=false},limit=1] as @a[gamemode=!spectator] at @s run function bacaptmh:detect/relay
# Boss-kill mirrors are consumed LAST, after BOTH readers, so neither eats the other's event.
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_kwitherp = @s bacaptmh_kwither
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_kwardenp = @s bacaptmh_kwarden
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_kdragonp = @s bacaptmh_kdragon
# --- mp8 shared plumbing -----------------------------------------------------------
# A real head count of this batch's own, so nothing here depends on where f4_count sits
# in the merged bucket. 'if entity @a[limit=N]' only ever tests for one match.
scoreboard players set #np8 bacaptmh_m8 0
execute as @a[gamemode=!spectator] run scoreboard players add #np8 bacaptmh_m8 1
# Travel mirrors are consumed here and only here, for EVERY player, every window, never
# behind a gate, so no mirror can go stale behind a closed gate and be read as a burst.
execute as @a run scoreboard players operation @s bacaptmh_walkd = @s bacaptmh_walk
execute as @a run scoreboard players operation @s bacaptmh_walkd -= @s bacaptmh_walkm
execute as @a run scoreboard players operation @s bacaptmh_walkm = @s bacaptmh_walk
execute as @a run scoreboard players operation @s bacaptmh_sprtd = @s bacaptmh_sprt
execute as @a run scoreboard players operation @s bacaptmh_sprtd -= @s bacaptmh_sprtm
execute as @a run scoreboard players operation @s bacaptmh_sprtm = @s bacaptmh_sprt
execute as @a run scoreboard players operation @s bacaptmh_walkd += @s bacaptmh_sprtd
# --- mp8 A1 Escort Mission ----------------------------------------------------------
execute if score #np8 bacaptmh_m8 matches 2.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:adventure/escort_mission=false}] at @s run function bacaptmh:detect/escort
# --- mp8 A4 Campfire Stories --------------------------------------------------------
# minecraft:location re-evaluates every 20 ticks, so the crouch flag is kept alive for
# three medium windows (1.5 s) rather than tested at the instant it happens.
execute as @a[scores={bacaptmh_cs=1..}] run scoreboard players remove @s bacaptmh_cs 1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:building/campfire_stories={sneak=true,impossible=false}}] run scoreboard players set @s bacaptmh_cs 3
advancement revoke @a[advancements={bacaptmh:building/campfire_stories={sneak=true,impossible=false}}] only bacaptmh:building/campfire_stories sneak
# Night from gametime modulo 24000. 'time query daytime' does not parse here, so this is
# the available reading of the clock; it drifts from the real time of day after /time set.
scoreboard players set #c24000 bacaptmh_m8 24000
execute store result score #tod bacaptmh_m8 run time query gametime
scoreboard players operation #tod bacaptmh_m8 %= #c24000 bacaptmh_m8
execute if score #np8 bacaptmh_m8 matches 4.. if score #tod bacaptmh_m8 matches 13000..22999 as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_cs=1..},advancements={bacaptmh:building/campfire_stories=false}] at @s run function bacaptmh:detect/campfire
# --- mp8 A13 Sparring Partners: a death on either side wipes that side's tally --------
# bacaptmh_sp_d is a vanilla deathCount objective: it ticks on every death whether or not
# the death screen is ever shown, so this works with doImmediateRespawn on. It is consumed
# here, so the counter can never leak, and the reset runs before the payout check below.
execute as @a[scores={bacaptmh_sp_d=1..}] run scoreboard players set @s bacaptmh_sp_h 0
execute as @a[scores={bacaptmh_sp_d=1..}] run scoreboard players set @s bacaptmh_sp_t 0
scoreboard players set @a[scores={bacaptmh_sp_d=1..}] bacaptmh_sp_d 0
execute if score #np8 bacaptmh_m8 matches 2.. if entity @a[scores={bacaptmh_sp_h=100..,bacaptmh_sp_t=100..},limit=1] as @a[gamemode=!spectator,scores={bacaptmh_sp_h=100..,bacaptmh_sp_t=100..},advancements={bacaptmh:statistics/sparring_partners=false}] at @s run function bacaptmh:detect/spar
# --- Too Many Hands batch mp12: Group Therapy ---------------------------------------
# Players are COUNTED into a private score. 'if entity @a[limit=3]' would only ever ask
# whether at least one player matches, so it guards nothing.
scoreboard players set #gtn bacaptmh_ap 0
execute as @a[gamemode=!spectator] run scoreboard players add #gtn bacaptmh_ap 1
execute if score #gtn bacaptmh_ap matches 3.. if entity @a[gamemode=!spectator,advancements={bacaptmh:farming/group_therapy=false},limit=1] run function bacaptmh:detect/group_therapy
# Everything below is UNGATED on purpose: it must run whether or not the detector did,
# or a window freezes while the gate is shut and a lifetime statistic is read as an event.
scoreboard players remove @a[scores={bacaptmh_gt=1..}] bacaptmh_gt 1
scoreboard players remove @a[scores={bacaptmh_glow=1..}] bacaptmh_glow 1
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_hp=..6}] run scoreboard players set @s bacaptmh_glow 4
execute as @a run scoreboard players add @s bacaptmh_gapple 0
execute as @a run scoreboard players operation @s bacaptmh_gapple_m = @s bacaptmh_gapple
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:nether/escort_service=false}] at @s run function bacaptmh:detect/escort_service
execute as @a[gamemode=!spectator,gamemode=!creative] at @s run function bacaptmh:detect/signal_boost
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:enchanting/grant_money=false}] at @s run function bacaptmh:detect/grant_money
# --- Batch MP13 ---------------------------------------------------------------------
# Bread Winner - one latched hand-off window is one tick of the tally.
execute as @a[gamemode=!spectator,advancements={bacaptmh:statistics/bread_winner={fed=true,impossible=false}}] run function bacaptmh:detect/bread_winner
# Ghost Protocol - the Tag Team dragon sampler, on its own private stamp so it keeps running
# after everybody holds Tag Team and that detector stops being dispatched.
execute if score #players bacaptmh_sys matches 4.. if entity @a[gamemode=!spectator,advancements={bacaptmh:end/ghost_protocol=false},limit=1] in minecraft:the_end as @e[type=ender_dragon,limit=1] at @s run function bacaptmh:detect/ghost_protocol
# Synchronised Swimming - swim_one_cm only accrues in the swimming pose, so a positive delta
# over this window means 'was swimming', never 'walked through a puddle'. The mirror is
# refreshed for every eligible player every window, UNGATED, so it can never go stale while
# the check is skipped and then read as a burst of simultaneous swimming. The tag is applied
# whether or not a player already holds the advancement, so a holder still counts.
execute as @a[gamemode=!spectator,gamemode=!creative] if score @s bacaptmh_swim > @s bacaptmh_swimm run tag @s add bacaptmh_swimming
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_swimm = @s bacaptmh_swim
execute if score #players bacaptmh_sys matches 4.. as @a[gamemode=!spectator,gamemode=!creative,tag=bacaptmh_swimming,advancements={bacaptmh:biomes/synchronised_swimming=false}] at @s run function bacaptmh:detect/sync_swim_check
tag @a[tag=bacaptmh_swimming] remove bacaptmh_swimming
# Bunk Beds - a 10 s window opened by the sleep_in_bed statistic, then an exact one-block
# column test run in BOTH directions, so each sleeper is granted from their own iteration and
# no cross-player identity bookkeeping is needed. A sleeping player's hitbox is 0.2 x 0.2, so
# the dx/dy/dz box is precise: starting 1.9 blocks up admits a bed two blocks up and rejects
# one directly on top. The private mirror is refreshed ungated, every window.
scoreboard players remove @a[scores={bacaptmh_bunk=1..}] bacaptmh_bunk 1
execute as @a[gamemode=!spectator] if score @s bacaptmh_slp2 > @s bacaptmh_bunkm run scoreboard players set @s bacaptmh_bunk 20
execute as @a[gamemode=!spectator] run scoreboard players operation @s bacaptmh_bunkm = @s bacaptmh_slp2
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_bunk=1..},advancements={bacaptmh:building/bunk_beds=false}] at @s if block ~ ~ ~ #minecraft:beds positioned ~-0.5 ~1.9 ~-0.5 if entity @a[gamemode=!spectator,scores={bacaptmh_bunk=1..},dx=1,dy=8,dz=1] run advancement grant @s only bacaptmh:building/bunk_beds
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_bunk=1..},advancements={bacaptmh:building/bunk_beds=false}] at @s if block ~ ~ ~ #minecraft:beds positioned ~-0.5 ~-9.9 ~-0.5 if entity @a[gamemode=!spectator,scores={bacaptmh_bunk=1..},dx=1,dy=8,dz=1] run advancement grant @s only bacaptmh:building/bunk_beds
# Taking One For The Team - read Health once per player, let anyone on half a heart or less
# stamp the players standing with them, then open a watch when a stamped player dies. The
# stamp is taken from the LIVING player's position, so nothing is ever measured from where a
# corpse happens to be and this survives doImmediateRespawn. hp13 is only ever consumed in
# the same window it is written, under the same #players guard, so it cannot go stale.
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative] store result score @s bacaptmh_hp13 run data get entity @s Health 10
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_hp13=1..10}] at @s run scoreboard players operation @a[gamemode=!spectator,gamemode=!creative,distance=0.5..8] bacaptmh_sacw = @s bacaptmh_pid
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_hp13=1..10}] at @s run scoreboard players operation @a[gamemode=!spectator,gamemode=!creative,distance=0.5..8] bacaptmh_sacn = #f3now bacaptmh_tmp
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:monsters/taking_one_for_the_team=false}] if score @s bacaptmh_dtime > #f3cut100 bacaptmh_tmp if score @s bacaptmh_sacn > #f3cut100 bacaptmh_tmp unless score @s bacaptmh_dtime = @s bacaptmh_sacd run function bacaptmh:detect/sacrifice_open
execute as @a[gamemode=!spectator,scores={bacaptmh_sac=1..}] if score @s bacaptmh_dtime > #f3cut100 bacaptmh_tmp run scoreboard players set @s bacaptmh_sac -1
execute as @a[gamemode=!spectator,scores={bacaptmh_sac=1..}] run scoreboard players remove @s bacaptmh_sac 1
execute as @a[gamemode=!spectator,scores={bacaptmh_sac=0}] run function bacaptmh:detect/sacrifice_pay
# --- mp14 Rope-a-Dope: dealing any damage of your own breaks the blocking streak.
# bacaptmh_dmgd was refreshed for every non-spectator by detect/sample earlier in this
# same bucket, so this reads the current window's delta and nothing older.
execute as @a[scores={bacaptmh_dmgd=1..}] run scoreboard players set @s bacaptmh_rope 0
# --- mp14 Death and Taxes: the experience mirror is maintained UNGATED for everyone,
# so it cannot go stale behind the advancement gate. One query per player per window:
# xpd := now, xpd -= previous, xpn += xpd  (which leaves xpn == now).
execute as @a store result score @s bacaptmh_xpd run experience query @s points
execute as @a run scoreboard players operation @s bacaptmh_xpd -= @s bacaptmh_xpn
execute as @a run scoreboard players operation @s bacaptmh_xpn += @s bacaptmh_xpd
execute if entity @a[gamemode=!spectator,advancements={bacaptmh:enchanting/death_and_taxes=false},limit=1] if entity @a[scores={bacaptmh_tw=1..},limit=1] as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_xpd=1..},advancements={bacaptmh:enchanting/death_and_taxes=false}] at @s run function bacaptmh:detect/tax_claim
# --- expansion ---
# --- mpfill3: Hospital Wing. Runs every medium pass; it counts players and ages its own
# --- window internally, so there is nothing to gate the call on.
function bacaptmh:detect/hospital_wing
# --- Too Many Hands batch mpfill1 ---------------------------------------------------
# Have Your Cake - age the thirty-second window BEFORE anyone looks around, so a window
# set inside the detector lasts exactly the 60 medium ticks it is set to.
execute as @a[scores={bacaptmh_f1cake=1..}] run scoreboard players remove @s bacaptmh_f1cake 1
# Deliberately NOT gated on an online-player count: a latched criterion has to be consumed
# on the next pass, or it could sit around and pair with a cake eaten days later.
# gamemode=!creative because Player.canEat returns true for an invulnerable player, so a
# creative player really can eat cake and would otherwise count towards the four.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:farming/have_your_cake={bite=true,impossible=false}}] at @s run function bacaptmh:detect/have_your_cake
# --- Too Many Hands verification pass -----------------------------------------------
# Everything below runs after detect/sample and after the drop mirror, so #f3now, every
# death stamp and bacaptmh_toss are already current for this window.
# Soup Kitchen - one ungated foodLevel sample per player per window. This replaces seven
# copies of the same 23-item food list that existed only to spell out 'foodLevel <= 6'.
execute as @a[gamemode=!spectator] store result score @s bacaptmh_food run data get entity @s foodLevel
# Last Stand - the Warden fight roster. Stamped UNGATED for everyone, so a player who already
# holds the advancement still counts as a body in the fight and cannot lock anybody out, and
# aged first so a stamp set on this pass keeps its full two minutes (240 medium ticks).
scoreboard players remove @a[scores={bacaptmh_lsj=1..}] bacaptmh_lsj 1
execute as @a[gamemode=!spectator,gamemode=!creative] at @s if entity @e[type=warden,distance=..48,limit=1] run scoreboard players set @s bacaptmh_lsj 240
# Bounty Hunter - a monster kill opens a sixty-second window; Emeralds handed over inside it
# are the payment. Both criteria are consumed the pass they are seen, so neither can latch
# for days waiting for the other, and the impossible guard means the pair alone grants
# nothing. The window is opened BEFORE the pay-out is tested, so a kill and a payment inside
# the same half-second window still count.
scoreboard players remove @a[scores={bacaptmh_bhw=1..}] bacaptmh_bhw 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/bounty_hunter={earned_it=true,impossible=false}}] run scoreboard players set @s bacaptmh_bhw 120
advancement revoke @a[advancements={bacaptmh:monsters/bounty_hunter={earned_it=true,impossible=false}}] only bacaptmh:monsters/bounty_hunter earned_it
execute as @a[gamemode=!spectator,scores={bacaptmh_bhw=1..},advancements={bacaptmh:monsters/bounty_hunter={collected_the_bounty=true,impossible=false}}] run advancement grant @s only bacaptmh:monsters/bounty_hunter
advancement revoke @a[advancements={bacaptmh:monsters/bounty_hunter={collected_the_bounty=true,impossible=false}}] only bacaptmh:monsters/bounty_hunter collected_the_bounty
# Heart Surgery - sample the Creaking's actual target while it is alive. A Creaking only
# pursues while unobserved and its target is null for long stretches, so reading
# targeted_entity at the instant the heart is smashed cannot be relied on.
scoreboard players remove @a[scores={bacaptmh_hsv=1..}] bacaptmh_hsv 1
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:monsters/heart_surgery=false}] at @s as @e[type=creaking,distance=..32,limit=6,sort=nearest] on target if entity @s[type=player,gamemode=!spectator] run scoreboard players set @s bacaptmh_hsv 10
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,advancements={bacaptmh:monsters/heart_surgery={smashed=true,impossible=false}}] at @s run function bacaptmh:detect/heart_surgery
advancement revoke @a[advancements={bacaptmh:monsters/heart_surgery={smashed=true,impossible=false}}] only bacaptmh:monsters/heart_surgery smashed
# Homing Pigeon - the two halves are linked in time and in space. Being handed a Compass opens
# a five-minute window and records where the hand-over happened; the Lodestone then has to be
# used inside that window, at least sixty-four blocks away.
scoreboard players remove @a[scores={bacaptmh_hpw=1..}] bacaptmh_hpw 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:mining/homing_pigeon={handed=true,impossible=false}}] at @s run function bacaptmh:detect/homing_hand
advancement revoke @a[advancements={bacaptmh:mining/homing_pigeon={handed=true,impossible=false}}] only bacaptmh:mining/homing_pigeon handed
execute as @a[gamemode=!spectator,scores={bacaptmh_hpw=1..},advancements={bacaptmh:mining/homing_pigeon={arrived=true,impossible=false}}] at @s run function bacaptmh:detect/homing_arrive
advancement revoke @a[advancements={bacaptmh:mining/homing_pigeon={arrived=true,impossible=false}}] only bacaptmh:mining/homing_pigeon arrived
# Deep Recovery - somebody has to be standing over you when you go down in the deep, and then
# hand your belongings back at the surface. The claim is opened FROM the dead player, on the
# one pass where the corpse is still on the spot.
scoreboard players remove @a[scores={bacaptmh_dr=1..}] bacaptmh_dr 1
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative] if score @s bacaptmh_dtime = #f3now bacaptmh_tmp at @s run function bacaptmh:detect/deep_recovery
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_dr=1..,bacaptmh_toss=1..},advancements={bacaptmh:mining/deep_recovery=false}] at @s run function bacaptmh:detect/deep_return
# --- fix pass: ordering latches -----------------------------------------------------
# Three advancements whose criteria were independent AND groups with no ordering at all.
# Each is repaired the same way and without a single new objective: the first half is
# consumed into a persistent tag, and the second half is only honoured while that tag is
# on the player. A latch of the second half that predates the tag is thrown away.
# Wingman - 'took off in an Elytra somebody handed you', not 'has an Elytra and was handed
# a spare'. Anyone gliding on their own wings for weeks used to finish it on the toss.
advancement revoke @a[tag=!bacaptmh_wing,advancements={bacaptmh:end/wingman={took_off=true,impossible=false}}] only bacaptmh:end/wingman took_off
execute as @a[gamemode=!spectator,advancements={bacaptmh:end/wingman={gift=true,impossible=false}}] run tag @s add bacaptmh_wing
advancement revoke @a[advancements={bacaptmh:end/wingman={gift=true,impossible=false}}] only bacaptmh:end/wingman gift
execute as @a[gamemode=!spectator,tag=bacaptmh_wing,advancements={bacaptmh:end/wingman={took_off=true,impossible=false}}] run advancement grant @s only bacaptmh:end/wingman
tag @a[tag=bacaptmh_wing,advancements={bacaptmh:end/wingman=true}] remove bacaptmh_wing
# Rest In Pieces - the kill has to come first. 'felled_them' now demands a melee killing
# blow, so the mourner is the one who was standing over the body.
advancement revoke @a[tag=!bacaptmh_rip,advancements={bacaptmh:weaponry/rest_in_pieces={planted_the_rose=true,impossible=false}}] only bacaptmh:weaponry/rest_in_pieces planted_the_rose
execute as @a[gamemode=!spectator,advancements={bacaptmh:weaponry/rest_in_pieces={felled_them=true,impossible=false}}] run tag @s add bacaptmh_rip
advancement revoke @a[advancements={bacaptmh:weaponry/rest_in_pieces={felled_them=true,impossible=false}}] only bacaptmh:weaponry/rest_in_pieces felled_them
execute as @a[gamemode=!spectator,tag=bacaptmh_rip,advancements={bacaptmh:weaponry/rest_in_pieces={planted_the_rose=true,impossible=false}}] run advancement grant @s only bacaptmh:weaponry/rest_in_pieces
tag @a[tag=bacaptmh_rip,advancements={bacaptmh:weaponry/rest_in_pieces=true}] remove bacaptmh_rip
# Parting Gift - minecraft:entity_killed_player only fires when an ENTITY kills you, so
# lava, falls, drowning and the void never counted, and the pair was unordered besides.
# The death is read from bacaptmh_dtime instead, which detect/sample stamps for every
# non-spectator on every death whatever killed them. Arming is refused while a death is
# still fresh, so 'die, then be handed the item' cannot pass for 'be handed it, then die'.
execute as @a[gamemode=!spectator,advancements={bacaptmh:enchanting/parting_gift={cursed_gift=true,impossible=false}}] unless score @s bacaptmh_dtime > #f3cut1200 bacaptmh_tmp run tag @s add bacaptmh_pgift
advancement revoke @a[tag=bacaptmh_pgift,advancements={bacaptmh:enchanting/parting_gift={cursed_gift=true,impossible=false}}] only bacaptmh:enchanting/parting_gift cursed_gift
execute as @a[gamemode=!spectator,tag=bacaptmh_pgift,advancements={bacaptmh:enchanting/parting_gift=false}] if score @s bacaptmh_dtime > #f3cut1200 bacaptmh_tmp run advancement grant @s only bacaptmh:enchanting/parting_gift
tag @a[tag=bacaptmh_pgift,advancements={bacaptmh:enchanting/parting_gift=true}] remove bacaptmh_pgift
