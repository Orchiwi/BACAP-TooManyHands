# @s just ate a slice of cake. The 'bite' criterion is BACAP's own cake-eating structure
# (minecraft:default_block_use + location_check on minecraft:cake, exactly as
# technical/castaway_fail.json writes it), and requirements are [["bite"],["impossible"]],
# so the latch on its own can never complete the advancement.
# Consume the criterion FIRST, whatever happens below, so a failed match cannot leave it
# latched and re-fire on every single pass.
advancement revoke @s only bacaptmh:farming/have_your_cake bite

# Open a thirty-second window on this player. 60 medium ticks = 600 game ticks. The window
# is aged in bucket_medium ABOVE this call, so it lasts exactly as long as it is set here.
scoreboard players set @s bacaptmh_f1cake 60

# Count the eaters - players whose own window is still open - inside six blocks, which is
# one player's reach on a cake plus slack. 'execute store result ... if entity @a[...]'
# returns the match COUNT; a plain 'if entity @a[limit=4]' would only ever tell us that at
# least one player matched, which guards nothing.
scoreboard players set #cake bacaptmh_f1 0
execute store result score #cake bacaptmh_f1 if entity @a[gamemode=!spectator,gamemode=!creative,distance=..6,scores={bacaptmh_f1cake=1..}]
# Everyone who shared the cake is paid, not only whoever happened to take the last slice.
execute if score #cake bacaptmh_f1 matches 4.. run advancement grant @a[gamemode=!spectator,gamemode=!creative,distance=..6,scores={bacaptmh_f1cake=1..}] only bacaptmh:farming/have_your_cake
