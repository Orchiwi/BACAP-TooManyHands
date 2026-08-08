# Executed as/at a player who has just seated an Eye of Ender in an End Portal frame and does
# not yet hold the advancement. bacaptmh_eye is a counter this pack increments itself, never a
# mirrored statistic, so there is no lifetime-total-read-as-an-event hazard here.
scoreboard players add @s bacaptmh_eye 1
scoreboard players set @s bacaptmh_eyt 60
advancement revoke @s only bacaptmh:end/eye_contact seated
# Two players, both six eyes in, both still inside their 30-second freshness window, both within
# twelve blocks: that is one portal being filled together rather than two players who each
# happened to fill a portal somewhere once.
execute store result score #eyen bacaptmh_tmp run execute if entity @a[gamemode=!spectator,distance=..12,scores={bacaptmh_eye=6..,bacaptmh_eyt=1..}]
execute if score #eyen bacaptmh_tmp matches 2.. run advancement grant @a[gamemode=!spectator,distance=..12,scores={bacaptmh_eye=6..,bacaptmh_eyt=1..}] only bacaptmh:end/eye_contact
