# Exactly the three gassed victims, plus whoever actually threw a lingering potion.
advancement grant @a[gamemode=!spectator,scores={bacaptmh_gas=1..},distance=..12] only bacaptmh:potion/chemical_warfare
advancement grant @a[gamemode=!spectator,scores={bacaptmh_ling=1..},distance=..24] only bacaptmh:potion/chemical_warfare
scoreboard players set @a[gamemode=!spectator,scores={bacaptmh_gas=1..},distance=..12] bacaptmh_gas 0
