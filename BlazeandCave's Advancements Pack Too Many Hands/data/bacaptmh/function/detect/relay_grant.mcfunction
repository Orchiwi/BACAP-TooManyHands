# All three bosses are down, each with a teammate lying dead in that fight. Cooperative Mode
# is off, so the grant is explicit. It used to pay @a within 128 blocks of the LAST kill,
# which is most of the loaded combat area - a player who walked into the End thirty seconds
# earlier and touched none of the three bosses was paid in full. Each boss now tags whoever
# was present for it, and only players carrying all three tags are paid.
advancement grant @a[gamemode=!spectator,tag=bacaptmh.relay_w,tag=bacaptmh.relay_wa,tag=bacaptmh.relay_d] only bacaptmh:challenges/the_relay
# The three global flags and the presence tags are CONSUMED here: nothing else clears them,
# so leaving them set made the condition permanently true for everyone who joined later.
scoreboard players set #wither bacaptmh_relay 0
scoreboard players set #warden bacaptmh_relay 0
scoreboard players set #dragon bacaptmh_relay 0
tag @a remove bacaptmh.relay_w
tag @a remove bacaptmh.relay_wa
tag @a remove bacaptmh.relay_d
