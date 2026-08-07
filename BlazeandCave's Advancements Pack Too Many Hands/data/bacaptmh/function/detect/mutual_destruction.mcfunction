# Mutually Assured Destruction (A17). Both flags live for three cycles, so holding both
# means this player killed a player and died inside the last second and a half.
execute as @a[scores={bacaptmh_ekill=1..,bacaptmh_edeath=1..}] at @s run function bacaptmh:detect/mutual_pair
