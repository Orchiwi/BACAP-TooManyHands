# 24 slow ticks at five seconds each is the full two minutes.
execute store result score #ss bacapfel_tmp4 if entity @a[tag=bacapfel_dark,scores={bacapfel_dd=24..},distance=..48]
execute if score #ss bacapfel_tmp4 matches 3.. run advancement grant @a[tag=bacapfel_dark,scores={bacapfel_dd=24..},distance=..48] only bacapfel:challenges/sculk_silence
execute if score #ss bacapfel_tmp4 matches 3.. run scoreboard players set @a[tag=bacapfel_dark,scores={bacapfel_dd=24..},distance=..48] bacapfel_dd 0
