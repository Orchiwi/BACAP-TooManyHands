# A pearl just left this player's hand. Remember the block it was thrown from and open a
# five-second window; both are read by detect/pearl_pair while the window is live.
scoreboard players set @s bacaptmh_pw 100
execute store result score @s bacaptmh_px run data get entity @s Pos[0] 1
execute store result score @s bacaptmh_py run data get entity @s Pos[1] 1
execute store result score @s bacaptmh_pz run data get entity @s Pos[2] 1
