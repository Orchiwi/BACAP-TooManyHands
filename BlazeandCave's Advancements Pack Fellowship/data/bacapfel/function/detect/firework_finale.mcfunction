# Anchored on one launcher, so the finale actually happens in one place.
execute store result score #ff bacapfel_tmp4 if entity @a[gamemode=!spectator,scores={bacapfel_fwt=1..},distance=..32]
execute if score #ff bacapfel_tmp4 matches 4.. run advancement grant @a[gamemode=!spectator,scores={bacapfel_fwt=1..},distance=..32] only bacapfel:building/firework_finale
