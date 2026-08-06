# Mutually Assured Destruction (A17). Both flags live for three cycles, so holding both
# means this player killed a player and died inside the last second and a half.
execute as @a[scores={bacapfel_ekill=1..,bacapfel_edeath=1..}] at @s run function bacapfel:detect/mutual_pair
