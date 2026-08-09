# Hospital Wing. Called unconditionally from bucket_medium (one pass = 10 game ticks).
# bacaptmh_hp is a vanilla `health` objective: ceil(HP), so 4 is two hearts, 20 is full and
# 0 is a corpse. No criterion can read another player's health, which is why this one
# advancement gets the batch's only detection function.

# 1. Age the ward window FIRST, so a window opened further down lasts its full length.
#    At rest - and on the pass the window runs out - every stale flag is dropped, so a
#    failed attempt can never leave someone admitted forever.
execute if score #hw_win bacaptmh_mf3 matches 1.. run scoreboard players remove #hw_win bacaptmh_mf3 1
execute if score #hw_win bacaptmh_mf3 matches ..0 run scoreboard players set @a bacaptmh_hw 0

# 2. Headcount. Players are COUNTED with `execute store result`; `if entity @a[limit=N]`
#    would only ever say 'at least one matched'.
scoreboard players set #hw_all bacaptmh_mf3 0
execute store result score #hw_all bacaptmh_mf3 if entity @a[gamemode=!spectator]
scoreboard players set #hw_low bacaptmh_mf3 0
execute store result score #hw_low bacaptmh_mf3 if entity @a[gamemode=!spectator,scores={bacaptmh_hp=1..4}]

# 3. Three or more online and every last one of them under two hearts admits the whole
#    server. 120 medium passes = 1200 game ticks = one minute. If they are all still down
#    on the next pass the window simply refreshes; the clock starts from the last moment
#    the whole server was on the floor, which is the reading the description promises.
execute if score #hw_all bacaptmh_mf3 matches 4.. if score #hw_low bacaptmh_mf3 = #hw_all bacaptmh_mf3 run scoreboard players set @a[gamemode=!spectator] bacaptmh_hw 1
execute if score #hw_all bacaptmh_mf3 matches 4.. if score #hw_low bacaptmh_mf3 = #hw_all bacaptmh_mf3 run scoreboard players set #hw_win bacaptmh_mf3 120

# 4. Inside the window, count the ward and how much of it is back on full hearts.
scoreboard players set #hw_p bacaptmh_mf3 0
scoreboard players set #hw_ok bacaptmh_mf3 0
execute if score #hw_win bacaptmh_mf3 matches 1.. store result score #hw_p bacaptmh_mf3 if entity @a[gamemode=!spectator,scores={bacaptmh_hw=1}]
execute if score #hw_win bacaptmh_mf3 matches 1.. store result score #hw_ok bacaptmh_mf3 if entity @a[gamemode=!spectator,scores={bacaptmh_hw=1,bacaptmh_hp=20..}]

# 5. Everyone admitted is paid, not only whoever happened to heal last - Cooperative Mode
#    is off, so the grant has to name them all. Closing the window here makes step 1 clear
#    the flags on the next pass.
execute if score #hw_p bacaptmh_mf3 matches 3.. if score #hw_ok bacaptmh_mf3 = #hw_p bacaptmh_mf3 run advancement grant @a[gamemode=!spectator,scores={bacaptmh_hw=1}] only bacaptmh:potion/hospital_wing
execute if score #hw_p bacaptmh_mf3 matches 3.. if score #hw_ok bacaptmh_mf3 = #hw_p bacaptmh_mf3 run scoreboard players set #hw_win bacaptmh_mf3 0
