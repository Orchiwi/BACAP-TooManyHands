# credit exactly the player whose anvil marked him, and nobody else. He is tagged for
# the length of the grant, so a self-drop credits nobody and this cannot be done alone.
scoreboard players set @s bacaptmh_anvilv 0
scoreboard players operation #anvwho bacaptmh_sys = @s bacaptmh_anvfrom
tag @s add bacaptmh_anvil_victim
execute if score #anvwho bacaptmh_sys matches 1.. as @a[tag=!bacaptmh_anvil_victim,gamemode=!spectator,advancements={bacaptmh:weaponry/falling_out=false}] if score @s bacaptmh_pid = #anvwho bacaptmh_sys run advancement grant @s only bacaptmh:weaponry/falling_out
tag @s remove bacaptmh_anvil_victim
