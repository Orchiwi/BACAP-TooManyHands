# A4 Reunion - the isolation streak counts 5 s cycles with nobody else inside 5000
# blocks and is wiped the moment another player is that close, so it can only be filled
# by really being away from everyone. Ten minutes of it earns a ticket; two ticket
# holders standing together are reunited. The ticket is never handed back, so a veteran
# can always be the other half of somebody else's reunion.
execute as @a[gamemode=!spectator] at @s if entity @a[gamemode=!spectator,distance=0.1..5000] run scoreboard players set @s bacapfel_alone 0
execute as @a[gamemode=!spectator] at @s unless entity @a[gamemode=!spectator,distance=0.1..5000] run scoreboard players add @s bacapfel_alone 1
scoreboard players set @a[scores={bacapfel_alone=120..}] bacapfel_far 1
scoreboard players set @a[scores={bacapfel_alone=120..}] bacapfel_alone 0
execute as @a[gamemode=!spectator,scores={bacapfel_far=1},advancements={bacapfel:adventure/reunion=false}] at @s if entity @a[gamemode=!spectator,scores={bacapfel_far=1},distance=0.1..3] run function bacapfel:detect/reunion_grant
