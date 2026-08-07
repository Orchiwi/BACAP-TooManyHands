# Per-player housekeeping. Runs for every non-spectator every medium tick and is NEVER gated
# on advancement state, so no statistic mirror can go stale and the first sample after a join
# can never report a lifetime total as a fresh event.
execute unless score @s bacaptmh_dmgp matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_dmgp = @s bacaptmh_dmg
scoreboard players operation @s bacaptmh_dmgd = @s bacaptmh_dmg
scoreboard players operation @s bacaptmh_dmgd -= @s bacaptmh_dmgp
scoreboard players operation @s bacaptmh_dmgp = @s bacaptmh_dmg
execute if score @s bacaptmh_dmgd matches 1.. run scoreboard players operation @s bacaptmh_dmgt = #f3now bacaptmh_tmp
execute unless score @s bacaptmh_cartp matches -2147483648..2147483647 run scoreboard players operation @s bacaptmh_cartp = @s bacaptmh_cart
scoreboard players operation @s bacaptmh_cartd = @s bacaptmh_cart
scoreboard players operation @s bacaptmh_cartd -= @s bacaptmh_cartp
scoreboard players operation @s bacaptmh_cartp = @s bacaptmh_cart
# bacaptmh_deaths is a vanilla deathCount objective: it ticks up on every death whether or not
# the death screen is ever shown, so this works with doImmediateRespawn on. It is consumed
# here, so the counter can never leak, and the death screen is kept as a second path.
execute if score @s bacaptmh_deaths matches 1.. run scoreboard players operation @s bacaptmh_dtime = #f3now bacaptmh_tmp
scoreboard players set @s bacaptmh_deaths 0
execute if entity @s[nbt={Health:0.0f}] run scoreboard players operation @s bacaptmh_dtime = #f3now bacaptmh_tmp
