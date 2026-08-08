# ONE detector, two advancements, because Ferryman and Medevac are the same machine:
# a vehicle, a second player aboard who has to keep meeting a condition, and a vehicle
# distance statistic that only counts while they do. #b7mode picks the half. The medium
# bucket calls this file once per mode and each call is gated on the player MISSING that
# advancement, so the mirror a half depends on is refreshed on every cycle that half runs
# and neither statistic can go stale behind the other.
# Players are never written into a vehicle's Passengers NBT, so 'on vehicle ... on
# passengers' is the only reliable way to see who else is aboard; the rower excludes
# himself with a tag rather than with a distance test, because two riders of one vehicle
# share a position.
tag @s add bacaptmh_ferry_self

# ---- mode 1: Ferryman. A boat, 1000 blocks, carrying a passenger who died in the last
# ten minutes and is carrying absolutely nothing.
execute if score #b7mode bacaptmh_tmp matches 1 run scoreboard players operation #b7d bacaptmh_tmp = @s bacaptmh_boat
execute if score #b7mode bacaptmh_tmp matches 1 run scoreboard players operation #b7d bacaptmh_tmp -= @s bacaptmh_boatm
execute if score #b7mode bacaptmh_tmp matches 1 run scoreboard players operation @s bacaptmh_boatm = @s bacaptmh_boat
execute if score #b7mode bacaptmh_tmp matches 1 run scoreboard players set #b7ok bacaptmh_tmp 0
execute if score #b7mode bacaptmh_tmp matches 1 on vehicle if entity @s[type=#blazeandcave:all_boats] on passengers if entity @s[type=player,tag=!bacaptmh_ferry_self,gamemode=!spectator] if score @s bacaptmh_dtime > #b7cut bacaptmh_tmp unless items entity @s container.* * unless items entity @s armor.head * unless items entity @s armor.chest * unless items entity @s armor.legs * unless items entity @s armor.feet * unless items entity @s weapon.offhand * run scoreboard players set #b7ok bacaptmh_tmp 1
# The moment the passenger stops qualifying the run is thrown away, so the thousand
# blocks have to be one unbroken ride. The delta is bounded so a mirror that ever went
# stale cannot be cashed in as one window of rowing.
execute if score #b7mode bacaptmh_tmp matches 1 if score #b7ok bacaptmh_tmp matches 0 run scoreboard players set @s bacaptmh_ferry 0
execute if score #b7mode bacaptmh_tmp matches 1 if score #b7ok bacaptmh_tmp matches 1 if score #b7d bacaptmh_tmp matches 1..20000 run scoreboard players operation @s bacaptmh_ferry += #b7d bacaptmh_tmp
execute if score #b7mode bacaptmh_tmp matches 1 if score @s bacaptmh_ferry matches 100000.. on vehicle on passengers if entity @s[type=player,gamemode=!spectator] run advancement grant @s only bacaptmh:adventure/ferryman

# ---- mode 2: Medevac. A Happy Ghast, 200 blocks, carrying a passenger who stays alive
# and under three hearts the whole way. bacaptmh_hp is a health objective, so a passenger
# who dies reads 0, fails the 1..5 test and resets the run - that is the 'without them
# dying' clause, and healing up breaks it too.
execute if score #b7mode bacaptmh_tmp matches 2 run scoreboard players operation #b7d bacaptmh_tmp = @s bacaptmh_hg
execute if score #b7mode bacaptmh_tmp matches 2 run scoreboard players operation #b7d bacaptmh_tmp -= @s bacaptmh_hgm
execute if score #b7mode bacaptmh_tmp matches 2 run scoreboard players operation @s bacaptmh_hgm = @s bacaptmh_hg
execute if score #b7mode bacaptmh_tmp matches 2 run scoreboard players set #b7ok bacaptmh_tmp 0
execute if score #b7mode bacaptmh_tmp matches 2 on vehicle if entity @s[type=happy_ghast] on passengers if entity @s[type=player,tag=!bacaptmh_ferry_self,gamemode=!spectator,scores={bacaptmh_hp=1..5}] run scoreboard players set #b7ok bacaptmh_tmp 1
execute if score #b7mode bacaptmh_tmp matches 2 if score #b7ok bacaptmh_tmp matches 0 run scoreboard players set @s bacaptmh_medvac 0
execute if score #b7mode bacaptmh_tmp matches 2 if score #b7ok bacaptmh_tmp matches 1 if score #b7d bacaptmh_tmp matches 1..20000 run scoreboard players operation @s bacaptmh_medvac += #b7d bacaptmh_tmp
execute if score #b7mode bacaptmh_tmp matches 2 if score @s bacaptmh_medvac matches 20000.. on vehicle on passengers if entity @s[type=player,gamemode=!spectator] run advancement grant @s only bacaptmh:nether/medevac

tag @s remove bacaptmh_ferry_self
