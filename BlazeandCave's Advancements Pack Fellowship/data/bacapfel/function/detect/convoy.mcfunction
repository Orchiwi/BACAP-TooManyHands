# Executed as/at a player who does not hold the advancement.
# A positive minecart_one_cm delta only accrues while actually riding a moving minecart; the
# delta is produced by detect/sample, which runs ungated and seeds its baseline on first sight.
tag @e[type=minecart,distance=..20] remove bacapfel_cnv
execute as @a[gamemode=!spectator,gamemode=!creative,distance=..20,scores={bacapfel_cartd=1..}] on vehicle if entity @s[type=minecart,distance=..20] run tag @s add bacapfel_cnv
execute store result score #f3cnn bacapfel_tmp run execute if entity @e[type=minecart,tag=bacapfel_cnv,distance=..20]
execute if score #f3cnn bacapfel_tmp matches 4.. as @e[type=minecart,tag=bacapfel_cnv,distance=..20] on passengers if entity @s[type=player,gamemode=!spectator,gamemode=!creative] run advancement grant @s only bacapfel:redstone/convoy
tag @e[type=minecart,distance=..20] remove bacapfel_cnv
