# @s just hung a painting ('hung' latched, impossible guard still false). Consume the
# criterion first so a failed match cannot re-fire it on every pass.
advancement revoke @s only bacaptmh:building/gallery_opening hung

# Open a one-minute window on this player. 120 medium ticks = 1200 game ticks.
# The window is aged in bucket_medium BEFORE this runs, so it lasts exactly as long as
# it is set to here.
scoreboard players set @s bacaptmh_gal 120

# Count the hangers - people whose own window is still open - inside twelve blocks.
# 'execute store result ... if entity @a[...]' returns the match COUNT; a plain
# 'if entity @a[limit=4]' would only ever tell us that at least one player matched.
scoreboard players set #gal bacaptmh_mp6 0
execute store result score #gal bacaptmh_mp6 if entity @a[gamemode=!spectator,gamemode=!creative,distance=..12,scores={bacaptmh_gal=1..}]
execute if score #gal bacaptmh_mp6 matches 4.. run advancement grant @a[gamemode=!spectator,gamemode=!creative,distance=..12,scores={bacaptmh_gal=1..}] only bacaptmh:building/gallery_opening
