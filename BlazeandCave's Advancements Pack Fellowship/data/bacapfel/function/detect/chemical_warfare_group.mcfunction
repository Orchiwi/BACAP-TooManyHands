execute store result score #cw bacapfel_tmp4 if entity @a[gamemode=!spectator,scores={bacapfel_gas=1..},distance=..12]
execute if score #cw bacapfel_tmp4 matches 3.. run function bacapfel:detect/chemical_warfare_grant
