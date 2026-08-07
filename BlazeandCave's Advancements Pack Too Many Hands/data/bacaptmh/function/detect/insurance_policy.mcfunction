# Anchored on one totem user, so it is one shared disaster rather than four separate ones.
execute store result score #ip bacaptmh_tmp4 if entity @a[gamemode=!spectator,scores={bacaptmh_tott=1..},distance=..48]
execute if score #ip bacaptmh_tmp4 matches 4.. run advancement grant @a[gamemode=!spectator,scores={bacaptmh_tott=1..},distance=..48] only bacaptmh:challenges/insurance_policy
