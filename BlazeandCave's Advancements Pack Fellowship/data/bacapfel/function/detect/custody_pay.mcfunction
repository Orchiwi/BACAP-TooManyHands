# Runs as the animal. Both halves of the pair are credited: whoever just fed it, and
# whoever named it, found by matching the stamp against player ids.
scoreboard players operation #cuown bacapfel_sys = @s bacapfel_owner
advancement grant @a[tag=bacapfel_cu_feeder] only bacapfel:adventure/shared_custody
execute as @a[gamemode=!spectator] if score @s bacapfel_pid = #cuown bacapfel_sys run advancement grant @s only bacapfel:adventure/shared_custody
