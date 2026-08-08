# Executed as/at a non-spectator who does not hold the advancement, once per medium tick, with
# three or more players online. bacaptmh_fire is refreshed for EVERY non-spectator by an ungated
# pair of bucket lines, so a player who already holds this still counts towards somebody else's
# three and no burning state is ever read from a stale score.
scoreboard players set #mp4tbf bacaptmh_tmp 0
execute as @a[gamemode=!spectator,gamemode=!creative,distance=..16] if score @s bacaptmh_fire matches 1.. run scoreboard players add #mp4tbf bacaptmh_tmp 1
# Three alight at once arms all three for twenty medium ticks (ten seconds) and stamps the death
# count they had at that moment, so anyone who dies instead of putting themselves out drops out.
# bacaptmh_tbfdc is a deathCount objective materialised in seed_lines, so it is always set - the
# shared bacaptmh_dtime is simply absent for a player who has never died and comparing against it
# would have made this unobtainable for them.
execute if score #mp4tbf bacaptmh_tmp matches 3.. as @a[gamemode=!spectator,gamemode=!creative,distance=..16] if score @s bacaptmh_fire matches 1.. run scoreboard players set @s bacaptmh_tbf 20
execute if score #mp4tbf bacaptmh_tmp matches 3.. as @a[gamemode=!spectator,gamemode=!creative,distance=..16] if score @s bacaptmh_fire matches 1.. run scoreboard players operation @s bacaptmh_tbfd = @s bacaptmh_tbfdc
# Payout: three armed players, none of them still burning, none of them dead since being armed.
scoreboard players set #mp4tbo bacaptmh_tmp 0
execute as @a[gamemode=!spectator,distance=..16,scores={bacaptmh_tbf=1..}] if score @s bacaptmh_fire matches ..0 if score @s bacaptmh_tbfd = @s bacaptmh_tbfdc run scoreboard players add #mp4tbo bacaptmh_tmp 1
execute if score #mp4tbo bacaptmh_tmp matches 3.. as @a[gamemode=!spectator,distance=..16,scores={bacaptmh_tbf=1..}] if score @s bacaptmh_fire matches ..0 if score @s bacaptmh_tbfd = @s bacaptmh_tbfdc run advancement grant @s only bacaptmh:monsters/trial_by_fire
