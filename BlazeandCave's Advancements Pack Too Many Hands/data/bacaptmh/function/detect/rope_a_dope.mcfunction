# Run as the blocker. The criterion is consumed here and only here, so it can only be
# re-set by the next real blocked PvP hit and one block can never be counted twice.
# The streak itself is reset in the medium bucket the moment this player deals damage.
advancement revoke @s only bacaptmh:weaponry/rope_a_dope
scoreboard players add @s bacaptmh_rope 1
execute if score @s bacaptmh_rope matches 20.. run scoreboard players set @s bacaptmh_rope 0
execute if score @s bacaptmh_rope matches 0 run advancement grant @s only bacaptmh:weaponry/rope_a_dope
