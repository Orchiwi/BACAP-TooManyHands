# credit exactly the player whose anvil marked him, and nobody else. He is tagged for
# the length of the grant, so a self-drop credits nobody and this cannot be done alone.
scoreboard players set @s bacapfel_anvilv 0
scoreboard players operation #anvwho bacapfel_sys = @s bacapfel_anvfrom
tag @s add bacapfel_anvil_victim
execute if score #anvwho bacapfel_sys matches 1.. as @a[tag=!bacapfel_anvil_victim,gamemode=!spectator,advancements={bacapfel:weaponry/falling_out=false}] if score @s bacapfel_pid = #anvwho bacapfel_sys run advancement grant @s only bacapfel:weaponry/falling_out
tag @s remove bacapfel_anvil_victim
