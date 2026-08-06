# Participants = everyone here who both gave and received, plus anyone here who already
# holds the advancement AND has thrown an item inside the same 10 s window. A granted
# advancement can never latch a criterion again, so holders need a channel that outlives
# the grant; bacapfel_toss is that channel, stamped from the vanilla Items Dropped
# statistic by an ungated bucket_medium line. Standing there doing nothing counts for
# nobody - that was the hole in counting holders by presence alone.
execute store result score #k bacapfel_n if entity @a[gamemode=!spectator,distance=..16,scores={bacapfel_a2_give=1..,bacapfel_a2_get=1..}]
execute store result score #v bacapfel_n if entity @a[gamemode=!spectator,distance=..16,scores={bacapfel_toss=1..},advancements={bacapfel:adventure/secret_santa=true}]
scoreboard players operation #k bacapfel_n += #v bacapfel_n
execute if score #k bacapfel_n matches 4.. run function bacapfel:detect/secret_santa_grant
