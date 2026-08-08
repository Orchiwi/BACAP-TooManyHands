# Executed as and at a recoverer who has dropped something in the last ten seconds while one
# of his claims is still live. It only pays out at or above sea level, and only beside the
# owner of that claim - matched by the stored id, never by substituting a name into a
# selector. The window is closed on the pay-out so one death cannot be cashed twice.
execute store result score #dr_y bacaptmh_tmp run data get entity @s Pos[1]
execute unless score #dr_y bacaptmh_tmp matches 0.. run return 0
scoreboard players operation #dr_own bacaptmh_tmp = @s bacaptmh_drm
tag @s add bacaptmh_dr_self
execute as @a[gamemode=!spectator,tag=!bacaptmh_dr_self,distance=..6] if score @s bacaptmh_pid = #dr_own bacaptmh_tmp run tag @s add bacaptmh_dr_owner
tag @s remove bacaptmh_dr_self
execute if entity @a[tag=bacaptmh_dr_owner,limit=1] run scoreboard players set @s bacaptmh_dr 0
execute if entity @a[tag=bacaptmh_dr_owner,limit=1] run advancement grant @s only bacaptmh:mining/deep_recovery
execute if entity @a[tag=bacaptmh_dr_owner,limit=1] run advancement grant @a[tag=bacaptmh_dr_owner] only bacaptmh:mining/deep_recovery
tag @a remove bacaptmh_dr_owner
