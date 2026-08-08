# @s has just picked Emeralds up off ANOTHER player's drop ('won' latched, the
# impossible guard still false - requirements are [[bid],[won],[impossible]], three
# AND groups, so the criteria alone can never complete this).
# Consume the criterion FIRST, whatever happens below, so a failed match cannot leave
# it latched and re-fire this function every single tick.
advancement revoke @s only bacaptmh:adventure/going_going_gone won

# Sellers are players whose own Emeralds were taken by somebody else inside the last
# thirty seconds: bacaptmh_bid is set to 600 in bucket_fast and aged there, so a live
# score is a fresh sale and nothing else. No stat mirror is involved anywhere in this
# advancement, so there is no lifetime total that could ever be read as an event.
# 'execute store result ... if entity' returns the match COUNT; a plain
# 'if entity @a[limit=3]' would only ever tell us that at least one player matched.
# distance=..8 is the auction floor and also keeps the selector bounded.
scoreboard players set #f4 bacaptmh_f4 0
execute store result score #f4 bacaptmh_f4 if entity @a[gamemode=!spectator,distance=..8,scores={bacaptmh_bid=1..}]

# Three live sellers on the floor closes the auction. Everyone who sold is paid, and
# so is the buyer - Cooperative Mode is off, so the grant has to name them all, and @s
# is granted separately because he may or may not be one of the three himself.
# Three players suffice and two never can: A->B, B->C, C->A leaves all three windows
# open on that last pickup, while two players can only ever reach a count of two.
execute if score #f4 bacaptmh_f4 matches 3.. run advancement grant @a[gamemode=!spectator,distance=..8,scores={bacaptmh_bid=1..}] only bacaptmh:adventure/going_going_gone
execute if score #f4 bacaptmh_f4 matches 3.. run advancement grant @s only bacaptmh:adventure/going_going_gone
