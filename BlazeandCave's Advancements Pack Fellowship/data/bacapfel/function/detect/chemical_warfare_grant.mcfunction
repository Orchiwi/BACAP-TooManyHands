# Exactly the three gassed victims, plus whoever actually threw a lingering potion.
advancement grant @a[gamemode=!spectator,scores={bacapfel_gas=1..},distance=..12] only bacapfel:potion/chemical_warfare
advancement grant @a[gamemode=!spectator,scores={bacapfel_ling=1..},distance=..24] only bacapfel:potion/chemical_warfare
scoreboard players set @a[gamemode=!spectator,scores={bacapfel_gas=1..},distance=..12] bacapfel_gas 0
