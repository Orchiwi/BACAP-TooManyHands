# A12 Group Nap - every online player in bed inside the same 60 s window. The window is
# real time, so it does not depend on doDaylightCycle or on the daytime ever re-entering
# any particular band. Players who already hold it are picked up by the vanilla
# sleep_in_bed statistic instead of by the criterion, which they can no longer latch.
execute store result score #n bacaptmh_n if entity @a[gamemode=!spectator]
execute if score #n bacaptmh_n matches ..1 run return 0
scoreboard players remove @a[scores={bacaptmh_nap=1..}] bacaptmh_nap 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/group_nap={slept=true,guard=false}}] run scoreboard players set @s bacaptmh_nap 120
advancement revoke @a[advancements={bacaptmh:adventure/group_nap=false}] only bacaptmh:adventure/group_nap slept
execute as @a[gamemode=!spectator] if score @s bacaptmh_sleep > @s bacaptmh_sleepp run scoreboard players set @s bacaptmh_nap 120
execute store result score #k bacaptmh_n if entity @a[gamemode=!spectator,scores={bacaptmh_nap=1..}]
execute if score #k bacaptmh_n = #n bacaptmh_n run function bacaptmh:detect/group_nap_grant
