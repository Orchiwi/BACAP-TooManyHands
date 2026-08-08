# @s just placed a rail ('laid_track' latched, impossible guard still false). Consume the
# criterion first so a failed match cannot re-fire it on every pass.
advancement revoke @s only bacaptmh:redstone/mind_the_gap laid_track

# bacaptmh_mcd is this batch's own minecart_one_cm delta over the last medium tick,
# refreshed in bucket_medium just above and seeded in bacaptmh:seed so a lifetime cart
# total can never be read as a fresh event. Anyone it is positive for was rolling in a
# cart while the rail went down. distance=1..16 excludes @s.
scoreboard players set #mtg bacaptmh_mp6 0
execute store result score #mtg bacaptmh_mp6 if entity @a[gamemode=!spectator,distance=1..16,scores={bacaptmh_mcd=1..}]
execute if score #mtg bacaptmh_mp6 matches 1.. run advancement grant @s only bacaptmh:redstone/mind_the_gap
execute if score #mtg bacaptmh_mp6 matches 1.. run advancement grant @a[gamemode=!spectator,distance=1..16,scores={bacaptmh_mcd=1..}] only bacaptmh:redstone/mind_the_gap
