# Per-player housekeeping. Runs for every non-spectator every medium tick and is NEVER gated
# on advancement state, so no statistic mirror can go stale and the first sample after a join
# can never report a lifetime total as a fresh event.
execute unless score @s bacapfel_dmgp matches -2147483648..2147483647 run scoreboard players operation @s bacapfel_dmgp = @s bacapfel_dmg
scoreboard players operation @s bacapfel_dmgd = @s bacapfel_dmg
scoreboard players operation @s bacapfel_dmgd -= @s bacapfel_dmgp
scoreboard players operation @s bacapfel_dmgp = @s bacapfel_dmg
execute if score @s bacapfel_dmgd matches 1.. run scoreboard players operation @s bacapfel_dmgt = #f3now bacapfel_tmp
execute unless score @s bacapfel_cartp matches -2147483648..2147483647 run scoreboard players operation @s bacapfel_cartp = @s bacapfel_cart
scoreboard players operation @s bacapfel_cartd = @s bacapfel_cart
scoreboard players operation @s bacapfel_cartd -= @s bacapfel_cartp
scoreboard players operation @s bacapfel_cartp = @s bacapfel_cart
# bacapfel_deaths is a vanilla deathCount objective: it ticks up on every death whether or not
# the death screen is ever shown, so this works with doImmediateRespawn on. It is consumed
# here, so the counter can never leak, and the death screen is kept as a second path.
execute if score @s bacapfel_deaths matches 1.. run scoreboard players operation @s bacapfel_dtime = #f3now bacapfel_tmp
scoreboard players set @s bacapfel_deaths 0
execute if entity @s[nbt={Health:0.0f}] run scoreboard players operation @s bacapfel_dtime = #f3now bacapfel_tmp
