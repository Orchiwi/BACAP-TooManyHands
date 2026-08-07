# A14 Vault Crew - four different players unlock the same ominous vault. 'The same vault'
# is read off the vault block itself, so it does not depend on who still lacks the
# advancement and cannot be satisfied by standing next to people who already hold it.
scoreboard players remove @a[scores={bacaptmh_vault=1..}] bacaptmh_vault 1
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/vault_crew={unlock=true,guard=false}}] at @s run function bacaptmh:detect/vault_crew_mark
execute as @a[gamemode=!spectator,scores={bacaptmh_vault=1..}] at @s run function bacaptmh:detect/vault_crew_check
