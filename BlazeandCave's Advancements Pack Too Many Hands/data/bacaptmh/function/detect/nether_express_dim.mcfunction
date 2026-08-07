# Run unconditionally over @a every medium tick - never behind a player-count or
# advancement gate, and not even behind gamemode=!spectator, so no player can ever come
# back to a stale dimension score and arm a phantom window with it.
# 0 = overworld, 1 = nether, 2 = end
scoreboard players set #nd bacaptmh_tmp4 0
execute if dimension minecraft:the_nether run scoreboard players set #nd bacaptmh_tmp4 1
execute if dimension minecraft:the_end run scoreboard players set #nd bacaptmh_tmp4 2

# First sighting of this player: seed the score without arming the window
execute unless score @s bacaptmh_dim matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_dim = #nd bacaptmh_tmp4

# Any crossing into or out of the Nether opens a ten-second window (20 medium ticks)
execute unless score @s bacaptmh_dim = #nd bacaptmh_tmp4 if score #nd bacaptmh_tmp4 matches 1 run scoreboard players set @s bacaptmh_pt 20
execute unless score @s bacaptmh_dim = #nd bacaptmh_tmp4 if score @s bacaptmh_dim matches 1 run scoreboard players set @s bacaptmh_pt 20

scoreboard players operation @s bacaptmh_dim = #nd bacaptmh_tmp4
