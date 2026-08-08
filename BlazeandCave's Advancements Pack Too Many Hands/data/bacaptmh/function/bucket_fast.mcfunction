scoreboard players add #hb_fast bacaptmh_sys 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:potion/field_medic={dosed=true,impossible=false}}] at @s run function bacaptmh:detect/field_medic
execute as @a[gamemode=!spectator,advancements={bacaptmh:potion/chemical_warfare={gassed=true,impossible=false}}] at @s run function bacaptmh:detect/chemical_warfare
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:building/barn_raising={place=true,impossible=false}}] at @s run function bacaptmh:detect/barn_raising
execute as @a[gamemode=!spectator,advancements={bacaptmh:challenges/the_gauntlet={hand_off=true,impossible=false}}] at @s run function bacaptmh:detect/gauntlet
execute if entity @a[gamemode=!spectator,scores={bacaptmh_wt=1..},limit=1] as @a[gamemode=!spectator,gamemode=!creative] if predicate blazeandcave:is_on_ground run scoreboard players set @s bacaptmh_fall 0
execute if entity @a[gamemode=!spectator,scores={bacaptmh_wt=1..},limit=1] as @a[gamemode=!spectator,gamemode=!creative] at @s unless predicate blazeandcave:is_on_ground run function bacaptmh:detect/trust_fall
execute if score #f2players bacaptmh_sys matches 2.. as @a[gamemode=!spectator] at @s run function bacaptmh:detect/f2_near
execute if entity @a[scores={bacaptmh_wd_timer=1..},limit=1] run function bacaptmh:detect/wind_check
execute if entity @a[gamemode=!spectator,advancements={bacaptmh:adventure/the_wave=false},limit=1] run function bacaptmh:detect/wave
execute as @a run scoreboard players operation @s bacaptmh_jumpp = @s bacaptmh_jump
# --- expansion ---
execute as @a[gamemode=!spectator,advancements={bacaptmh:biomes/thar_she_blows={harpooned=true,impossible=false}}] run function bacaptmh:detect/thar_she_blows
execute if score #players bacaptmh_sys matches 3.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:challenges/king_of_the_hill=false}] at @s run function bacaptmh:detect/king_of_the_hill
# ---- mp1: Cover Fire (weaponry). Per tick, not per ten, because the rescued player's health
# is read live and half a second is long enough for them to heal past the bar or die.
# The rescued player is granted FIRST: granting the sniper first would flip his impossible
# flag true and drop him out of the next line's selector before it ever ran.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:weaponry/cover_fire={sniped=true,impossible=false}}] at @s run advancement grant @a[distance=1..80,gamemode=!spectator,scores={bacaptmh_m1hp=1..3}] only bacaptmh:weaponry/cover_fire
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:weaponry/cover_fire={sniped=true,impossible=false}}] at @s if entity @a[distance=1..80,gamemode=!spectator,scores={bacaptmh_m1hp=1..3}] run advancement grant @s only bacaptmh:weaponry/cover_fire
execute as @a[advancements={bacaptmh:weaponry/cover_fire={sniped=true,impossible=false}}] run advancement revoke @s only bacaptmh:weaponry/cover_fire sniped
# ---- mp1: Distraction Tactics (adventure). Same reasoning - the teammate's health is live.
# distance=1..30 from the ringer excludes the ringer himself, so this cannot be self-served.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:adventure/distraction_tactics={rang=true,impossible=false}}] at @s if entity @e[type=#minecraft:raiders,distance=..30,limit=1] run advancement grant @a[distance=1..30,gamemode=!spectator,scores={bacaptmh_m1hp=1..5}] only bacaptmh:adventure/distraction_tactics
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:adventure/distraction_tactics={rang=true,impossible=false}}] at @s if entity @e[type=#minecraft:raiders,distance=..30,limit=1] if entity @a[distance=1..30,gamemode=!spectator,scores={bacaptmh_m1hp=1..5}] run advancement grant @s only bacaptmh:adventure/distraction_tactics
execute as @a[advancements={bacaptmh:adventure/distraction_tactics={rang=true,impossible=false}}] run advancement revoke @s only bacaptmh:adventure/distraction_tactics rang
# --- Too Many Hands batch mp3 -------------------------------------------------------
# One gametime read per tick, shared by every player Storm Chasers looks at.
execute store result score #sc_now bacaptmh_tmp run time query gametime
execute if score #players bacaptmh_sys matches 2.. if entity @a[gamemode=!spectator,advancements={bacaptmh:enchanting/storm_chasers=false},limit=1] as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_b3i=1}] at @s run function bacaptmh:detect/storm_chasers
# Vending Machine's payment window ages here and is only ever opened by the detector.
scoreboard players remove @a[scores={bacaptmh_vmt=1..}] bacaptmh_vmt 1
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:redstone/vending_machine=false}] at @s if block ~ ~-1 ~ minecraft:hopper run function bacaptmh:detect/vending_machine
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:redstone/vending_machine=false},scores={bacaptmh_vmt=1..}] at @s run function bacaptmh:detect/vending_machine
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:weaponry/bare_knuckle_boxing={kill=true,impossible=false}}] run function bacaptmh:detect/bare_knuckle
# --- mp8 A10 Death Do Us Part ------------------------------------------------------
# Decay first, stamp second, so a stamp set this tick is not immediately shortened.
execute as @a[scores={bacaptmh_dup=1..}] run scoreboard players remove @s bacaptmh_dup 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/death_do_us_part={creeper=true,impossible=false}}] run scoreboard players set @s bacaptmh_dup 6
advancement revoke @a[advancements={bacaptmh:monsters/death_do_us_part={creeper=true,impossible=false}}] only bacaptmh:monsters/death_do_us_part creeper
execute if entity @a[scores={bacaptmh_dup=1..},limit=1] as @a[gamemode=!spectator,scores={bacaptmh_dup=1..},advancements={bacaptmh:monsters/death_do_us_part=false}] at @s run function bacaptmh:detect/death_pair
# --- mp8 A13 Sparring Partners: consume the two PvP flags, one count each per tick ---
# The criterion is revoked in the same tick it is counted, so it can never latch and
# re-fire; the counters are only ever read by detect/spar, never consumed by it.
execute as @a[gamemode=!spectator,advancements={bacaptmh:statistics/sparring_partners={hit=true,impossible=false}}] run scoreboard players add @s bacaptmh_sp_h 1
advancement revoke @a[advancements={bacaptmh:statistics/sparring_partners={hit=true,impossible=false}}] only bacaptmh:statistics/sparring_partners hit
execute as @a[gamemode=!spectator,advancements={bacaptmh:statistics/sparring_partners={hurt=true,impossible=false}}] run scoreboard players add @s bacaptmh_sp_t 1
advancement revoke @a[advancements={bacaptmh:statistics/sparring_partners={hurt=true,impossible=false}}] only bacaptmh:statistics/sparring_partners hurt
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:biomes/sea_legs=false}] at @s run function bacaptmh:detect/sea_legs
execute as @a[gamemode=!spectator,advancements={bacaptmh:statistics/gift_economy={gave=true,impossible=false}}] run function bacaptmh:detect/gift_economy
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:building/bricked_in={place=true,guard=false}}] at @s run function bacaptmh:detect/bricked_in
execute if score #players bacaptmh_sys matches 3.. as @a[gamemode=!spectator,advancements={bacaptmh:monsters/last_stand={slew=true,guard=false}}] at @s run function bacaptmh:detect/last_stand
execute if score #players bacaptmh_sys matches 2.. as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaptmh:nether/air_rescue=false}] at @s if entity @e[type=happy_ghast,distance=..24,limit=1] run function bacaptmh:detect/air_rescue
# --- mp14 Pearl Swap -------------------------------------------------------------
# The ender-pearl mirror is consumed UNGATED, never behind the advancement gate: a gated
# mirror goes stale while the gate is shut and then reads a lifetime throw count as one
# fresh throw the moment a new player reopens it.
execute as @a[gamemode=!spectator,gamemode=!creative] at @s if score @s bacaptmh_pearl > @s bacaptmh_pearlp run function bacaptmh:detect/pearl_mark
execute as @a run scoreboard players operation @s bacaptmh_pearlp = @s bacaptmh_pearl
execute as @a[scores={bacaptmh_pw=1..}] run scoreboard players remove @s bacaptmh_pw 1
execute if entity @a[gamemode=!spectator,advancements={bacaptmh:end/pearl_swap=false},limit=1] as @a[gamemode=!spectator,gamemode=!creative,scores={bacaptmh_pw=1..},advancements={bacaptmh:end/pearl_swap=false}] at @s run function bacaptmh:detect/pearl_pair
# --- mp14 Release the Hounds ------------------------------------------------------
# Must be in the FAST bucket: the tick tag runs at the end of the same server tick the
# death was processed in, so @s is still on the death spot and the wolves are still there.
execute as @a[gamemode=!spectator,advancements={bacaptmh:animal/release_the_hounds={mauled=true,impossible=false}}] at @s run function bacaptmh:detect/release_the_hounds
# --- mp14 Bait and Switch ---------------------------------------------------------
execute as @a[gamemode=!spectator,advancements={bacaptmh:monsters/bait_and_switch={looted=true,impossible=false}}] at @s run function bacaptmh:detect/bait_and_switch
# --- mp14 Rope-a-Dope -------------------------------------------------------------
execute as @a[gamemode=!spectator,advancements={bacaptmh:weaponry/rope_a_dope={blocked=true,impossible=false}}] run function bacaptmh:detect/rope_a_dope
# --- mp14 Death and Taxes ---------------------------------------------------------
# bacaptmh_dcount is this advancement's own deathCount objective, consumed in tax_death,
# so it never races the medium-bucket consumers of bacaptmh_deaths / bacaptmh_death.
execute as @a[scores={bacaptmh_dcount=1..}] at @s run function bacaptmh:detect/tax_death
execute as @a[scores={bacaptmh_tw=1..}] run scoreboard players remove @s bacaptmh_tw 1
# --- expansion ---
# --- Too Many Hands batch MPFILL4 --------------------------------------------
# Going, Going, Gone. Age every live bid window FIRST, so a window opened below
# lasts exactly the 600 ticks it is given and never 601.
execute as @a[scores={bacaptmh_bid=1..}] run scoreboard players remove @s bacaptmh_bid 1
# A seller is a player whose dropped Emeralds were picked up by somebody else
# ('bid' latched, impossible guard still false). Open a thirty-second window on him.
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/going_going_gone={bid=true,impossible=false}}] run scoreboard players set @s bacaptmh_bid 600
# Consume the criterion in the same tick, or it stays latched and re-opens the
# window every single tick for as long as he lacks the advancement.
advancement revoke @a[gamemode=!spectator,advancements={bacaptmh:adventure/going_going_gone={bid=true,impossible=false}}] only bacaptmh:adventure/going_going_gone bid
# The buyer is whoever just picked Emeralds up off another player's drop. Runs after
# the window lines above, so the sale that armed him is already on the floor.
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/going_going_gone={won=true,impossible=false}}] at @s run function bacaptmh:detect/going_going_gone
# --- Head of the Household (weaponry) ----------------------------------------
# Age every open blast window FIRST, so a window opened below lasts its full 600 ticks.
execute as @a[scores={bacaptmh_hoh=1..}] run scoreboard players remove @s bacaptmh_hoh 1
# A player just killed by a Charged Creeper opens a thirty-second window on every OTHER
# player standing in the blast. Fast bucket, not medium: the corpse has to still be on
# the death spot when the window is opened around it.
execute as @a[gamemode=!spectator,advancements={bacaptmh:weaponry/head_of_the_household={blown_up=true,impossible=false}}] at @s run function bacaptmh:detect/head_of_the_household
advancement revoke @a[advancements={bacaptmh:weaponry/head_of_the_household={blown_up=true,impossible=false}}] only bacaptmh:weaponry/head_of_the_household blown_up
# The head-taker is a witness whose inventory changed inside that window while a head
# carrying a minecraft:profile component - i.e. a real player's head, not a crafted or
# creative one - was in it. Only players with a live window are ever read, so the NBT
# scan costs nothing on a normal tick.
execute as @a[gamemode=!spectator,scores={bacaptmh_hoh=1..},advancements={bacaptmh:weaponry/head_of_the_household={took_the_head=true,impossible=false}}] if data entity @s Inventory[{id:"minecraft:player_head",components:{"minecraft:profile":{}}}] run advancement grant @s only bacaptmh:weaponry/head_of_the_household
# Consume the hook in the same tick, whatever happened above: inventory_changed re-fires
# on every slot change and a latched criterion would otherwise re-test forever.
advancement revoke @a[advancements={bacaptmh:weaponry/head_of_the_household={took_the_head=true,impossible=false}}] only bacaptmh:weaponry/head_of_the_household took_the_head
