# @s tripped the melee-kill criterion on another player. Consume the latch FIRST, whatever
# happens next, so a failed check cannot leave it set and re-fire on every tick.
advancement revoke @s only bacaptmh:weaponry/bare_knuckle_boxing kill
# Death drops carry a pickup delay and this runs on the very next tick, so a killer who
# was empty-handed at the moment of the kill is still empty-handed here. container.*
# covers the hotbar and the main inventory (weapon.mainhand is an alias into it); the four
# armour slots and the offhand are checked separately because container.* excludes them.
execute unless items entity @s container.* * unless items entity @s armor.head * unless items entity @s armor.chest * unless items entity @s armor.legs * unless items entity @s armor.feet * unless items entity @s weapon.offhand * run advancement grant @s only bacaptmh:weaponry/bare_knuckle_boxing
