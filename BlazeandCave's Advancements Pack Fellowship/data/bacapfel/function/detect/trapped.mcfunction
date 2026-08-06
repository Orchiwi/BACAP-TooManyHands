# @s just opened a trapped chest. Consume the criterion first, whatever happens next,
# so a failed match cannot leave it latched and re-fire every cycle.
advancement revoke @s only bacapfel:redstone/trapped opened

# The trapper is someone who placed a trapped chest in the last minute, tracked by the
# bacapfel_tct window - not anyone who ever placed one at any point in world history.
tag @s add bacapfel_opener
execute if entity @a[gamemode=!spectator,scores={bacapfel_tct=1..},tag=!bacapfel_opener,distance=..32,limit=1] run function bacapfel:detect/trapped_grant
tag @s remove bacapfel_opener
