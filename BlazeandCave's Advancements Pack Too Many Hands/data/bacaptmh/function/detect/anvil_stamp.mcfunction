# Falling Out (A21), attribution half. Run as a live falling anvil, at it. A falling
# anvil records nothing about who released it, so the anvil is attributed to the single
# nearest player who placed an anvil in the last ten seconds - one player, by id, never
# a broadcast to everyone who has been building with anvils.
scoreboard players set #anvwho bacaptmh_sys 0
execute as @a[scores={bacaptmh_armed=1..},distance=..12,limit=1,sort=nearest] run scoreboard players operation #anvwho bacaptmh_sys = @s bacaptmh_pid
execute if score #anvwho bacaptmh_sys matches 1.. as @a[distance=..2.5,gamemode=!spectator] run function bacaptmh:detect/anvil_stamped
