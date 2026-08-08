# @s latched the hand-off criterion during the last half second. Consume it FIRST, whatever
# happens next, so a failed pass can never leave it latched and re-fire every window.
# One latched window is one tick of the tally, so a whole stack thrown and collected in one
# go counts once - the description promises 'hand food over five hundred times', not five
# hundred individual items.
advancement revoke @s only bacaptmh:statistics/bread_winner fed
scoreboard players add @s bacaptmh_fed 1
execute if score @s bacaptmh_fed matches 500.. run advancement grant @s only bacaptmh:statistics/bread_winner
