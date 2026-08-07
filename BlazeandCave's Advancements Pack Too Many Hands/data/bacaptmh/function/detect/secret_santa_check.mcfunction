# Participants = everyone here who both gave and received, plus anyone here who already
# holds the advancement AND has thrown an item inside the same 10 s window. A granted
# advancement can never latch a criterion again, so holders need a channel that outlives
# the grant; bacaptmh_toss is that channel, stamped from the vanilla Items Dropped
# statistic by an ungated bucket_medium line. Standing there doing nothing counts for
# nobody - that was the hole in counting holders by presence alone.
execute store result score #k bacaptmh_n if entity @a[gamemode=!spectator,distance=..16,scores={bacaptmh_a2_give=1..,bacaptmh_a2_get=1..}]
execute store result score #v bacaptmh_n if entity @a[gamemode=!spectator,distance=..16,scores={bacaptmh_toss=1..},advancements={bacaptmh:adventure/secret_santa=true}]
scoreboard players operation #k bacaptmh_n += #v bacaptmh_n
execute if score #k bacaptmh_n matches 4.. run function bacaptmh:detect/secret_santa_grant
