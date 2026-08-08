# Executed as and at a player the death sampler has just seen fall, on the one pass where the
# corpse is still lying on the spot. Anyone else down there with him is handed a five-minute
# claim on his belongings, carried as bacaptmh_pid so the pay-out can name exactly one player
# instead of being broadcast.
# Death drops themselves cannot be detected: Inventory.dropAll drops with traceItem=false, so
# the item entities carry no thrower and minecraft:thrown_item_picked_up_by_player can never
# fire on them. Presence at the death is the observable part of the same story.
# Under doImmediateRespawn there is no corpse; Pos is then the respawn point, the depth test
# below fails and nothing is claimed, which is the safe way to be wrong.
execute store result score #dr_y bacaptmh_tmp run data get entity @s Pos[1]
execute unless score #dr_y bacaptmh_tmp matches ..-50 run return 0
scoreboard players operation #dr_who bacaptmh_tmp = @s bacaptmh_pid
# distance=0.5..24, never 0..24, so the dead player can never claim his own drops.
execute as @a[gamemode=!spectator,gamemode=!creative,distance=0.5..24] run scoreboard players operation @s bacaptmh_drm = #dr_who bacaptmh_tmp
execute as @a[gamemode=!spectator,gamemode=!creative,distance=0.5..24] run scoreboard players set @s bacaptmh_dr 600
