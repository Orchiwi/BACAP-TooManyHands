# A10 Death Do Us Part. Run at a player who died to a creeper in the last six ticks.
# One shared explosion is approximated by two creeper deaths inside six ticks and sixteen
# blocks; commands cannot compare the creeper's UUID between two victims.
execute store result score #dd bacaptmh_m8 if entity @a[scores={bacaptmh_dup=1..},distance=..16]
execute if score #dd bacaptmh_m8 matches 2.. run advancement grant @a[gamemode=!spectator,scores={bacaptmh_dup=1..},distance=..16] only bacaptmh:monsters/death_do_us_part
