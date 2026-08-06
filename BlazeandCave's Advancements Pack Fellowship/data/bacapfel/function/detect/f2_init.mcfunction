# first sight of this player: start every statistic mirror from zero, and hand him a
# permanent id. Every paired credit in this block - who threw the wind charge, whose
# anvil it was, which three players a snowball thrower has already hit - is carried as
# that id, so a payout can name exactly one player instead of being broadcast.
scoreboard players set @s bacapfel_pkill 0
scoreboard players set @s bacapfel_death 0
scoreboard players set @s bacapfel_blocked 0
scoreboard players add #pidnext bacapfel_sys 1
scoreboard players operation @s bacapfel_pid = #pidnext bacapfel_sys
scoreboard players set @s bacapfel_f2init 1
