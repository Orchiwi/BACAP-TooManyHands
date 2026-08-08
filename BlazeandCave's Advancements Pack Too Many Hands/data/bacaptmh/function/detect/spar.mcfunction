# A13 Sparring Partners. Run at a player who has both tallies at 100 or more.
# The pair is what is checked, not the individual: two players within 24 blocks who have
# EACH dealt and taken a hundred player hits without dying. That mutual threshold stands
# in for 'the same player', which no scoreboard can pin, and it is also what enforces
# 'without either of you dying' - a death wipes one side and the pair no longer matches.
execute store result score #sp bacaptmh_m8 if entity @a[gamemode=!spectator,scores={bacaptmh_sp_h=100..,bacaptmh_sp_t=100..},distance=..24]
execute if score #sp bacaptmh_m8 matches 2.. run advancement grant @a[gamemode=!spectator,scores={bacaptmh_sp_h=100..,bacaptmh_sp_t=100..},distance=..24] only bacaptmh:statistics/sparring_partners
