# Second, independent route: four live unlockers inside 8 blocks and 10 seconds, which is
# what four people opening one vault together produce. There is deliberately no 'somebody
# who already holds it is standing here' term - that let one unlocker plus three idle
# veterans finish the challenge.
execute store result score #k bacapfel_n if entity @a[gamemode=!spectator,scores={bacapfel_vault=1..},distance=..8]
execute if score #k bacapfel_n matches 4.. run function bacapfel:detect/vault_crew_grant
