# Shield Wall (A24). eblock is live for one second after that player's shield actually
# stopped damage; count the flagged players around each flagged player, himself included.
execute as @a[scores={bacaptmh_eblock=1..}] at @s store result score @s bacaptmh_sw_near run execute if entity @a[scores={bacaptmh_eblock=1..},distance=..8]
execute as @a[scores={bacaptmh_eblock=1..,bacaptmh_sw_near=3..},gamemode=!spectator,advancements={bacaptmh:weaponry/shield_wall=false}] run advancement grant @s only bacaptmh:weaponry/shield_wall
