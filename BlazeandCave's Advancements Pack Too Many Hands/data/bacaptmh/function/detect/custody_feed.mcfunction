# The feeder is credited only if a nearby animal carries somebody else's stamp.
# The stamp test lives INSIDE the selector, because selector arguments resolve before any
# trailing `if` clause: the old `sort=nearest,limit=1 if score @s bacaptmh_owner matches 1..`
# grabbed whatever entity was closest and then threw the pair away when that entity turned
# out to be an unstamped herd-mate. `scores={bacaptmh_owner=1..}` makes the walk consider
# only stamped animals; the one-shot flag stops after the first that is not the feeder's own.
scoreboard players operation #cufeed bacaptmh_sys = @s bacaptmh_pid
scoreboard players set #cudone bacaptmh_sys 0
tag @s add bacaptmh_cu_feeder
execute as @e[type=!minecraft:player,distance=..5,scores={bacaptmh_owner=1..},sort=nearest,limit=16] if score #cudone bacaptmh_sys matches 0 unless score @s bacaptmh_owner = #cufeed bacaptmh_sys run function bacaptmh:detect/custody_pay
tag @s remove bacaptmh_cu_feeder
advancement revoke @s only bacaptmh:animal/shared_custody fed
