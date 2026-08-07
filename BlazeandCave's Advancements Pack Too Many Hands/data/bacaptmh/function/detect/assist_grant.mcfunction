# Executed as/at the softened monster that just died. Two different players must both have
# dealt damage in the last 100 ticks for this to be an assist rather than a solo kill.
tag @s remove bacaptmh_softened
scoreboard players set #f3asn bacaptmh_tmp 0
execute as @a[gamemode=!spectator,gamemode=!creative,distance=..16] if score @s bacaptmh_dmgt > #f3cut100 bacaptmh_tmp run scoreboard players add #f3asn bacaptmh_tmp 1
execute if score #f3asn bacaptmh_tmp matches 2.. as @a[gamemode=!spectator,gamemode=!creative,distance=..16] if score @s bacaptmh_dmgt > #f3cut100 bacaptmh_tmp run advancement grant @s only bacaptmh:monsters/assist
