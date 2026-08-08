# Executed as/at a player who does not yet hold Starter Kit, once per medium tick.
# The three pickup criteria are latched by vanilla and would otherwise accumulate over a whole
# world, so anything caught more than 600 ticks (thirty seconds) after this player's last death
# is revoked again. That revocation, not the criteria, is what makes the set mean 'resupplied
# after dying' rather than 'given things, ever'. bacaptmh_dtime is the death stamp kept by
# detect/sample, which runs earlier in this same bucket, is never gated on an advancement and is
# refreshed for every non-spectator, so it cannot be stale. A player who has never died has no
# dtime score at all: the comparison fails and all three criteria are revoked every pass, which
# is exactly the wanted behaviour.
scoreboard players operation #mp4skcut bacaptmh_tmp = #f3now bacaptmh_tmp
scoreboard players remove #mp4skcut bacaptmh_tmp 600
execute unless score @s bacaptmh_dtime > #mp4skcut bacaptmh_tmp run advancement revoke @s only bacaptmh:adventure/starter_kit sword
execute unless score @s bacaptmh_dtime > #mp4skcut bacaptmh_tmp run advancement revoke @s only bacaptmh:adventure/starter_kit pickaxe
execute unless score @s bacaptmh_dtime > #mp4skcut bacaptmh_tmp run advancement revoke @s only bacaptmh:adventure/starter_kit food
# All three inside the window pays the RESUPPLIED player only. It used to grant to
# @a within 12 blocks so the givers would be paid too, but nothing in the criteria can
# name a giver, so that also paid anyone who happened to be standing nearby - a third
# player at a furnace, or a creative-mode admin. Someone still has to throw the items,
# so this remains unearnable alone.
execute if entity @s[advancements={bacaptmh:adventure/starter_kit={sword=true,pickaxe=true,food=true}}] run advancement grant @s only bacaptmh:adventure/starter_kit
