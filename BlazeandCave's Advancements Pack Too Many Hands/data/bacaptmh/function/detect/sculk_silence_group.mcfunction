# 24 slow ticks at five seconds each is the full two minutes.
execute store result score #ss bacaptmh_tmp4 if entity @a[tag=bacaptmh_dark,scores={bacaptmh_dd=24..},distance=..48]
execute if score #ss bacaptmh_tmp4 matches 3.. run advancement grant @a[tag=bacaptmh_dark,scores={bacaptmh_dd=24..},distance=..48] only bacaptmh:challenges/sculk_silence
execute if score #ss bacaptmh_tmp4 matches 3.. run scoreboard players set @a[tag=bacaptmh_dark,scores={bacaptmh_dd=24..},distance=..48] bacaptmh_dd 0
