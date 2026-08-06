# Executed as/at a player whose damage_dealt rose in this window.
# Only ordinary monsters are walked. The tag keeps armour stands, boats, item frames,
# villagers and farm animals out of the search; the three explicit exclusions keep the bosses
# out of it. #blazeandcave:hostile_monsters contains ender_dragon, wither and warden, and each
# of those lingers at 0 health through a long death animation with two or more co-located
# damagers in range, so without the exclusions Assist would have been granted automatically
# alongside Tag Team, Wither Committee and Warden Party.
execute as @e[type=#blazeandcave:hostile_monsters,type=!ender_dragon,type=!wither,type=!warden,distance=..12] at @s run function bacapfel:detect/assist_mob
