# Storm Chasers - executed as/at every seeded survival player, every tick, and only while
# somebody still lacks it. A Riptide launch is the used:trident statistic ticking up while
# the trident is STILL in hand: a thrown trident has left the hand by the next tick, a
# Riptide one has not. #sc_now is set once per tick by the bucket, not once per player.
# The shared scratch below is zeroed first and both copies are gated on the source
# and mirror actually being SET. `scoreboard players operation` does not run at all
# while either side is unset, and a statistic has no entry until the player first
# performs the action - so an untouched player used to inherit the delta computed
# for whoever was iterated before them in the same sweep. `matches 0..` is false on
# an unset score, which is what makes the gate work.
scoreboard players set #sc_d bacaptmh_tmp 0
execute if score @s bacaptmh_trid matches 0.. if score @s bacaptmh_tridm matches 0.. run scoreboard players operation #sc_d bacaptmh_tmp = @s bacaptmh_trid
execute if score @s bacaptmh_trid matches 0.. if score @s bacaptmh_tridm matches 0.. run scoreboard players operation #sc_d bacaptmh_tmp -= @s bacaptmh_tridm
execute if score @s bacaptmh_trid matches 0.. run scoreboard players operation @s bacaptmh_tridm = @s bacaptmh_trid
execute if score #sc_d bacaptmh_tmp matches 1..20 if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:riptide" run scoreboard players operation @s bacaptmh_sct = #sc_now bacaptmh_tmp
# Everything below is the landing, so it only matters within ten seconds of a launch.
scoreboard players operation #sc_old bacaptmh_tmp = #sc_now bacaptmh_tmp
scoreboard players remove #sc_old bacaptmh_tmp 200
execute unless score @s bacaptmh_sct > #sc_old bacaptmh_tmp run return 0
execute unless predicate blazeandcave:is_on_ground run return 0
# The other launch has to have been inside a second of ours, and they have to be down too.
scoreboard players operation #sc_lo bacaptmh_tmp = @s bacaptmh_sct
scoreboard players remove #sc_lo bacaptmh_tmp 21
scoreboard players operation #sc_hi bacaptmh_tmp = @s bacaptmh_sct
scoreboard players add #sc_hi bacaptmh_tmp 21
tag @a remove bacaptmh_sc_mate
tag @s add bacaptmh_sc_self
execute as @a[gamemode=!spectator,gamemode=!creative,tag=!bacaptmh_sc_self,distance=..5] if score @s bacaptmh_sct > #sc_lo bacaptmh_tmp if score @s bacaptmh_sct < #sc_hi bacaptmh_tmp if predicate blazeandcave:is_on_ground run tag @s add bacaptmh_sc_mate
tag @s remove bacaptmh_sc_self
execute if entity @a[tag=bacaptmh_sc_mate,limit=1] run advancement grant @s only bacaptmh:enchanting/storm_chasers
execute if entity @a[tag=bacaptmh_sc_mate,limit=1] run advancement grant @a[tag=bacaptmh_sc_mate] only bacaptmh:enchanting/storm_chasers
tag @a remove bacaptmh_sc_mate
