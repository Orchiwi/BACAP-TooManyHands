# Executed as and at a player who has just killed a Creeper. The pay-out needs a victim:
# some OTHER player that a Creeper was hunting from inside its blast radius in the last three
# seconds, stamped by detect/bomb_disposal while the Creeper was still alive. The killer is
# tagged and excluded from the search, so a man standing point blank on his own kill can
# never stand in for the player he is supposed to have saved.
tag @s add bacaptmh_bd_self
execute if entity @a[gamemode=!spectator,tag=!bacaptmh_bd_self,distance=..16,scores={bacaptmh_bdv=1..},limit=1] run advancement grant @s only bacaptmh:monsters/bomb_disposal
execute if entity @a[gamemode=!spectator,tag=!bacaptmh_bd_self,distance=..16,scores={bacaptmh_bdv=1..},limit=1] run advancement grant @a[gamemode=!spectator,tag=!bacaptmh_bd_self,distance=..16,scores={bacaptmh_bdv=1..}] only bacaptmh:monsters/bomb_disposal
tag @s remove bacaptmh_bd_self
