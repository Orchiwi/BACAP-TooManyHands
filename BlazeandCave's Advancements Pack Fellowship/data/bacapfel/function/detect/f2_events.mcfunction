# Shared plumbing for the F2 weaponry block. Nothing gates this function: the statistic
# mirrors are consumed here and only here, every cycle, so no mirror can go stale behind
# a closed gate, and the flags it produces are only ever read - never consumed - by the
# detectors, so two advancements can never eat each other's events.

# decay the flags this cycle inherits before new ones are stamped
execute as @a[scores={bacapfel_ekill=1..}] run scoreboard players remove @s bacapfel_ekill 1
execute as @a[scores={bacapfel_edeath=1..}] run scoreboard players remove @s bacapfel_edeath 1
execute as @a[scores={bacapfel_eblock=1..}] run scoreboard players remove @s bacapfel_eblock 1
execute as @a[scores={bacapfel_armed=1..}] run scoreboard players remove @s bacapfel_armed 1
execute as @a[scores={bacapfel_anvilv=1..}] run scoreboard players remove @s bacapfel_anvilv 1
execute as @a[scores={bacapfel_tt_win=1..}] run scoreboard players remove @s bacapfel_tt_win 1
execute as @a[scores={bacapfel_sb_timer=1..}] run scoreboard players remove @s bacapfel_sb_timer 10

# a player seen for the first time has his mirrors zeroed before they are ever read, so
# the lifetime totals he arrives with cannot be mistaken for events that just happened
scoreboard players add @a bacapfel_f2init 0
execute as @a[scores={bacapfel_f2init=0}] run function bacapfel:detect/f2_init

# this cycle's statistic deltas become short-lived flags, then the mirrors are zeroed
execute as @a[scores={bacapfel_pkill=1..}] run scoreboard players set @s bacapfel_ekill 3
execute as @a[scores={bacapfel_death=1..}] run scoreboard players set @s bacapfel_edeath 3
execute as @a[scores={bacapfel_blocked=1..}] run scoreboard players set @s bacapfel_eblock 2
scoreboard players set @a bacapfel_pkill 0
scoreboard players set @a bacapfel_death 0
scoreboard players set @a bacapfel_blocked 0

# a real head count - execute if entity @a[limit=N] only ever tests for one player
execute as @a[gamemode=!spectator] run scoreboard players add #f2players bacapfel_sys 1
