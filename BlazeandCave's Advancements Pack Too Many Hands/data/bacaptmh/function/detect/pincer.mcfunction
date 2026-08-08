# Executed as/at a non-spectator, non-creative player whose damage_dealt rose in this
# window. The delta comes from detect/sample, which runs ungated for everyone and seeds
# its own baseline, so a lifetime damage_dealt total can never read as a fresh hit.
# Only the single nearest monster is considered, so two attackers are never matched up
# across two different mobs.
execute as @e[type=#blazeandcave:hostile_monsters,distance=..4.5,limit=1,sort=nearest] at @s run tag @a[distance=..4.5,scores={bacaptmh_dmgd=1..},gamemode=!spectator,gamemode=!creative] add bacaptmh_pin
# 'Opposite sides' is geometry, not trigonometry: both attackers inside 4.5 blocks of the
# mob while at least 7 blocks apart from each other puts the mob between them at roughly
# 100 degrees or more. Each half of a qualifying pair is granted; a third attacker
# standing beside one of them is not, because nobody is 7 blocks from him.
execute as @a[tag=bacaptmh_pin] at @s if entity @a[tag=bacaptmh_pin,distance=7..] run advancement grant @s only bacaptmh:monsters/pincer_movement
tag @a remove bacaptmh_pin
