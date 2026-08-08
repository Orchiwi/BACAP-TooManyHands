# Anchored on one levitating player, so the three of them are levitating in one place
# rather than in three separate End cities - or three separate dimensions, which an
# unanchored @a count happily accepted.
execute store result score #m1levn bacaptmh_sys run execute if entity @a[gamemode=!spectator,scores={bacaptmh_m1lev=1..},distance=..32]
execute if score #m1levn bacaptmh_sys matches 3.. run advancement grant @a[gamemode=!spectator,scores={bacaptmh_m1lev=1..},distance=..32] only bacaptmh:end/up_and_away
