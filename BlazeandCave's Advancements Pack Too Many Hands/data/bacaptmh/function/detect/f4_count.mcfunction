# Count the players properly. 'execute if entity @a[limit=N]' only ever tests for at
# least one match, so every guard in this batch reads this score instead.
scoreboard players set #players bacaptmh_sys 0
execute as @a[gamemode=!spectator] run scoreboard players add #players bacaptmh_sys 1
