# Seed every statistic mirror the first time we see a player, so a lifetime total is
# never mistaken for a fresh event. Each objective has its own private mirror; no two
# advancements share a delta. 'add 0' creates the entry at the player's current value.
scoreboard players set @s bacapfel_init 1
scoreboard players add @s bacapfel_splash 0
scoreboard players operation @s bacapfel_splash_m = @s bacapfel_splash
scoreboard players add @s bacapfel_lpot 0
scoreboard players operation @s bacapfel_lpot_m = @s bacapfel_lpot
scoreboard players add @s bacapfel_fw 0
scoreboard players operation @s bacapfel_fw_m = @s bacapfel_fw
scoreboard players add @s bacapfel_totem 0
scoreboard players operation @s bacapfel_totem_m = @s bacapfel_totem
scoreboard players add @s bacapfel_wbucket 0
scoreboard players operation @s bacapfel_wbucket_m = @s bacapfel_wbucket
scoreboard players add @s bacapfel_tchest 0
scoreboard players operation @s bacapfel_tchest_m = @s bacapfel_tchest

# Short-lived windows and continuous-presence streaks start closed. IMPORTANT: this whole
# block re-runs on every /reload, because start_extra clears bacapfel_init to force the
# mirror reseeding above. Nothing long-lived may be cleared here.
scoreboard players set @s bacapfel_medic 0
scoreboard players set @s bacapfel_ling 0
scoreboard players set @s bacapfel_gas 0
scoreboard players set @s bacapfel_fwt 0
scoreboard players set @s bacapfel_tott 0
scoreboard players set @s bacapfel_wt 0
scoreboard players set @s bacapfel_tct 0
scoreboard players set @s bacapfel_pt 0
scoreboard players set @s bacapfel_fall 0
scoreboard players set @s bacapfel_dd 0
scoreboard players set @s bacapfel_form 0

# Barn Raising's block tally is the one persistent counter in this batch, so it is created
# with 'add 0' rather than cleared with 'set 0' - otherwise every /reload wiped three
# builders' in-progress hundreds at once. bacapfel_cx/cz/cd are deliberately untouched,
# so the chunk key survives the reload and still matches the tally.
scoreboard players add @s bacapfel_barn 0
