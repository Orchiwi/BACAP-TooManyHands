# Executed as the survivor whose 120-window (60 s) watch just ran out without them picking up
# a death stamp - any death cancels the watch outright in bucket_medium. The watch is closed
# to -1 first so it can never re-fire. Both participants are paid, not only whoever tripped
# the check: Cooperative Mode is off, so the player who went down beside them is granted too,
# found by matching the stored player id.
scoreboard players set @s bacaptmh_sac -1
scoreboard players operation #s13m bacaptmh_sys = @s bacaptmh_sacm
advancement grant @s only bacaptmh:monsters/taking_one_for_the_team
execute as @a[gamemode=!spectator] if score @s bacaptmh_pid = #s13m bacaptmh_sys run advancement grant @s only bacaptmh:monsters/taking_one_for_the_team
