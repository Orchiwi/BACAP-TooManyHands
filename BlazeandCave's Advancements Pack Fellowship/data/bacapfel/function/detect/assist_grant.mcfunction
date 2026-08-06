# Executed as/at the softened monster that just died. Two different players must both have
# dealt damage in the last 100 ticks for this to be an assist rather than a solo kill.
tag @s remove bacapfel_softened
scoreboard players set #f3asn bacapfel_tmp 0
execute as @a[gamemode=!spectator,gamemode=!creative,distance=..16] if score @s bacapfel_dmgt > #f3cut100 bacapfel_tmp run scoreboard players add #f3asn bacapfel_tmp 1
execute if score #f3asn bacapfel_tmp matches 2.. as @a[gamemode=!spectator,gamemode=!creative,distance=..16] if score @s bacapfel_dmgt > #f3cut100 bacapfel_tmp run advancement grant @s only bacapfel:monsters/assist
