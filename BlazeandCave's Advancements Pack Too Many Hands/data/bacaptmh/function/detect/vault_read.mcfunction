# A vault keeps a list of every player it has already rewarded, so this is a real
# 'the same vault, four different people' count rather than a proximity guess, and it
# works the same for players who already hold the advancement. If the read fails the
# score stores 0 and the proximity route below still covers a crew opening one together.
execute store result score #k bacaptmh_n run data get block ~ ~ ~ server_data.rewarded_players
execute if score #k bacaptmh_n matches 4.. run function bacaptmh:detect/vault_crew_grant
