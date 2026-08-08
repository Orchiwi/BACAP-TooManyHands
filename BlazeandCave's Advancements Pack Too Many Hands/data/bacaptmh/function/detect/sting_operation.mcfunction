# Executed as/at a player carrying one of the two Sting Operation flags, entered once per flag.
# Every test carries impossible=false, so a completed advancement is never touched again and a
# revoke can never un-complete one that has already paid out.

# Angering bees stamps a 30-second window and releases the flag, so the next bee re-arms it.
execute if entity @s[advancements={bacaptmh:animal/sting_operation={angered=true,impossible=false}}] run scoreboard players set @s bacaptmh_stt 60
execute if entity @s[advancements={bacaptmh:animal/sting_operation={angered=true,impossible=false}}] run advancement revoke @s only bacaptmh:animal/sting_operation angered

# Death by bee pays out to every OTHER player still inside their anger window, then to the
# victim. distance=1..64 excludes @s, so a lone player who angers their own hive and dies to
# it finds nobody and gets nothing.
execute if entity @s[advancements={bacaptmh:animal/sting_operation={stung=true,impossible=false}}] if entity @a[gamemode=!spectator,distance=1..64,scores={bacaptmh_stt=1..}] run advancement grant @a[gamemode=!spectator,distance=1..64,scores={bacaptmh_stt=1..}] only bacaptmh:animal/sting_operation
execute if entity @s[advancements={bacaptmh:animal/sting_operation={stung=true,impossible=false}}] if entity @a[gamemode=!spectator,distance=1..64,scores={bacaptmh_stt=1..}] run advancement grant @s only bacaptmh:animal/sting_operation
# Only released if nobody claimed it - after a successful grant the guard above is false.
execute if entity @s[advancements={bacaptmh:animal/sting_operation={stung=true,impossible=false}}] run advancement revoke @s only bacaptmh:animal/sting_operation stung
