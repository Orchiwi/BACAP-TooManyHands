# run as a stamped player who has just died. The stamp only says he was standing under
# somebody's anvil; the cause of death is proved by the entity_hurt_player hook, which
# only fires when a falling anvil actually landed an unblocked hit on him.
# A player who already holds this advancement has every criterion permanently true, so
# his hooks say nothing - for him the stamp is the only evidence there is. That is
# deliberate: it keeps him usable as somebody else's victim instead of making the
# advancement unobtainable for the second player on a two-player world.
scoreboard players set #anvok bacaptmh_sys 0
execute if entity @s[advancements={bacaptmh:weaponry/falling_out={crushed_anvil=true}}] run scoreboard players set #anvok bacaptmh_sys 1
execute if entity @s[advancements={bacaptmh:weaponry/falling_out={crushed_chipped=true}}] run scoreboard players set #anvok bacaptmh_sys 1
execute if entity @s[advancements={bacaptmh:weaponry/falling_out={crushed_damaged=true}}] run scoreboard players set #anvok bacaptmh_sys 1
execute if score #anvok bacaptmh_sys matches 1 run function bacaptmh:detect/anvil_pay
