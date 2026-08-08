# Gift Economy - consume and re-arm the `gave` criterion so the score counts real hand-offs.
scoreboard players add @s bacaptmh_gift 1
advancement revoke @s only bacaptmh:statistics/gift_economy gave
execute if score @s bacaptmh_gift matches 500.. run advancement grant @s only bacaptmh:statistics/gift_economy
