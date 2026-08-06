# A12 Group Nap - every online player in bed inside the same 60 s window. The window is
# real time, so it does not depend on doDaylightCycle or on the daytime ever re-entering
# any particular band. Players who already hold it are picked up by the vanilla
# sleep_in_bed statistic instead of by the criterion, which they can no longer latch.
execute store result score #n bacapfel_n if entity @a[gamemode=!spectator]
execute if score #n bacapfel_n matches ..1 run return 0
scoreboard players remove @a[scores={bacapfel_nap=1..}] bacapfel_nap 1
execute as @a[gamemode=!spectator,advancements={bacapfel:adventure/group_nap={slept=true,guard=false}}] run scoreboard players set @s bacapfel_nap 120
advancement revoke @a[advancements={bacapfel:adventure/group_nap=false}] only bacapfel:adventure/group_nap slept
execute as @a[gamemode=!spectator] if score @s bacapfel_sleep > @s bacapfel_sleepp run scoreboard players set @s bacapfel_nap 120
execute store result score #k bacapfel_n if entity @a[gamemode=!spectator,scores={bacapfel_nap=1..}]
execute if score #k bacapfel_n = #n bacapfel_n run function bacapfel:detect/group_nap_grant
