# run as a player the snowball reached; the thrower still carries the owner tag. Every
# player in range is offered - the de-duplication happens per thrower, further down, so
# a player already counted this window no longer hides an uncounted player behind him.
scoreboard players operation #sbvic bacaptmh_sys = @s bacaptmh_pid
execute if score #sbvic bacaptmh_sys matches 1.. as @a[tag=bacaptmh_sb_owner,limit=1] run function bacaptmh:detect/snowball_tally
