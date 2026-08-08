# Executed as the player who died in the last five seconds while carrying a fresh mark from
# somebody who was on half a heart or less beside them. The death time is recorded FIRST, so
# one death can only ever open one watch however many windows its stamp stays fresh for.
scoreboard players operation @s bacaptmh_sacd = @s bacaptmh_dtime
scoreboard players operation #s13w bacaptmh_sys = @s bacaptmh_sacw
scoreboard players operation #s13m bacaptmh_sys = @s bacaptmh_pid
# The ally is found by matching the stored player id, never by substituting a name into a
# selector. An ally already running a watch is left alone, and the dead player's own id is
# stored on them so the pay-out can credit both halves.
execute as @a[gamemode=!spectator,gamemode=!creative] if score @s bacaptmh_pid = #s13w bacaptmh_sys unless score @s bacaptmh_sac matches 1.. run scoreboard players operation @s bacaptmh_sacm = #s13m bacaptmh_sys
execute as @a[gamemode=!spectator,gamemode=!creative] if score @s bacaptmh_pid = #s13w bacaptmh_sys unless score @s bacaptmh_sac matches 1.. run scoreboard players set @s bacaptmh_sac 120
