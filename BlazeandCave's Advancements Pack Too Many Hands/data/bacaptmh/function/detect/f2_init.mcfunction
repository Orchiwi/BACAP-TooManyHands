# first sight of this player: start every statistic mirror from zero, and hand him a
# permanent id. Every paired credit in this block - who threw the wind charge, whose
# anvil it was, which three players a snowball thrower has already hit - is carried as
# that id, so a payout can name exactly one player instead of being broadcast.
scoreboard players set @s bacaptmh_pkill 0
scoreboard players set @s bacaptmh_death 0
scoreboard players set @s bacaptmh_blocked 0
scoreboard players add #pidnext bacaptmh_sys 1
scoreboard players operation @s bacaptmh_pid = #pidnext bacaptmh_sys
scoreboard players set @s bacaptmh_f2init 1
