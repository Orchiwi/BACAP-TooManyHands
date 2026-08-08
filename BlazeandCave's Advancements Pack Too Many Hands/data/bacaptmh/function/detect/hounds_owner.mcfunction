# Run as the owner of the wolf that actually dealt the killing blow. The tag check is what
# stops a player being credited for their own wolf killing them.
execute if entity @s[type=minecraft:player,gamemode=!spectator,tag=!bacaptmh_mauled] run advancement grant @s only bacaptmh:animal/release_the_hounds
