# All three bosses are down, each with a teammate lying dead in that fight. Cooperative Mode
# is off, so the grant is explicit and covers the crew present at the last kill rather than
# the finisher alone. The three global flags are CONSUMED here: they are fake-player scores
# that nothing else clears, so leaving them set made the condition permanently true and
# handed the challenge to every player who joined the server afterwards.
advancement grant @a[gamemode=!spectator,distance=..128] only bacaptmh:challenges/the_relay
scoreboard players set #wither bacaptmh_relay 0
scoreboard players set #warden bacaptmh_relay 0
scoreboard players set #dragon bacaptmh_relay 0
