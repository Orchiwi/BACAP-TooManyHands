# @s just opened a trapped chest. Consume the criterion first, whatever happens next,
# so a failed match cannot leave it latched and re-fire every cycle.
advancement revoke @s only bacaptmh:redstone/trapped opened

# The trapper is someone who placed a trapped chest in the last minute, tracked by the
# bacaptmh_tct window - not anyone who ever placed one at any point in world history.
tag @s add bacaptmh_opener
execute if entity @a[gamemode=!spectator,scores={bacaptmh_tct=1..},tag=!bacaptmh_opener,distance=..32,limit=1] run function bacaptmh:detect/trapped_grant
tag @s remove bacaptmh_opener
