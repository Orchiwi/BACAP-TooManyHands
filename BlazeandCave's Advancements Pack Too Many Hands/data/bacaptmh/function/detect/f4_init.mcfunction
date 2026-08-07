# Seed every statistic mirror the first time we see a player, so a lifetime total is
# never mistaken for a fresh event. Each objective has its own private mirror; no two
# advancements share a delta. 'add 0' creates the entry at the player's current value.
scoreboard players set @s bacaptmh_init 1
scoreboard players add @s bacaptmh_splash 0
scoreboard players operation @s bacaptmh_splash_m = @s bacaptmh_splash
scoreboard players add @s bacaptmh_lpot 0
scoreboard players operation @s bacaptmh_lpot_m = @s bacaptmh_lpot
scoreboard players add @s bacaptmh_fw 0
scoreboard players operation @s bacaptmh_fw_m = @s bacaptmh_fw
scoreboard players add @s bacaptmh_totem 0
scoreboard players operation @s bacaptmh_totem_m = @s bacaptmh_totem
scoreboard players add @s bacaptmh_wbucket 0
scoreboard players operation @s bacaptmh_wbucket_m = @s bacaptmh_wbucket
scoreboard players add @s bacaptmh_tchest 0
scoreboard players operation @s bacaptmh_tchest_m = @s bacaptmh_tchest

# Short-lived windows and continuous-presence streaks start closed. IMPORTANT: this whole
# block re-runs on every /reload, because start_extra clears bacaptmh_init to force the
# mirror reseeding above. Nothing long-lived may be cleared here.
scoreboard players set @s bacaptmh_medic 0
scoreboard players set @s bacaptmh_ling 0
scoreboard players set @s bacaptmh_gas 0
scoreboard players set @s bacaptmh_fwt 0
scoreboard players set @s bacaptmh_tott 0
scoreboard players set @s bacaptmh_wt 0
scoreboard players set @s bacaptmh_tct 0
scoreboard players set @s bacaptmh_pt 0
scoreboard players set @s bacaptmh_fall 0
scoreboard players set @s bacaptmh_dd 0
scoreboard players set @s bacaptmh_form 0

# Barn Raising's block tally is the one persistent counter in this batch, so it is created
# with 'add 0' rather than cleared with 'set 0' - otherwise every /reload wiped three
# builders' in-progress hundreds at once. bacaptmh_cx/cz/cd are deliberately untouched,
# so the chunk key survives the reload and still matches the tally.
scoreboard players add @s bacaptmh_barn 0
