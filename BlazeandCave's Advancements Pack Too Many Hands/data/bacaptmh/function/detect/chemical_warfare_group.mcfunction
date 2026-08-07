execute store result score #cw bacaptmh_tmp4 if entity @a[gamemode=!spectator,scores={bacaptmh_gas=1..},distance=..12]
execute if score #cw bacaptmh_tmp4 matches 3.. run function bacaptmh:detect/chemical_warfare_grant
