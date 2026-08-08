# Run as a player who has just died, at the body, in the same tick - before any respawn
# can move them. bacaptmh_dcount is a deathCount objective consumed right here, so a
# lifetime death total can never be read as a death that just happened.
scoreboard players set @s bacaptmh_dcount 0
scoreboard players set @s bacaptmh_tw 300
execute store result score @s bacaptmh_tx run data get entity @s Pos[0] 1
execute store result score @s bacaptmh_ty run data get entity @s Pos[1] 1
execute store result score @s bacaptmh_tz run data get entity @s Pos[2] 1
