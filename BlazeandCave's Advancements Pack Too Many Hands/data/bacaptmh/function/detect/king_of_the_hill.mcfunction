# Executed as/at a non-spectator, non-creative player who does not hold the advancement, every
# tick, whenever three or more players are online.
# The 'hurt' criterion is used as an EVENT, not as a latch: it is consumed into a 200-tick
# contest window and revoked in the same pass, so a defender left alone runs the window down and
# the timer stops. Requirements on the advancement are [["hurt"],["impossible"]] - two AND-ed
# groups - so latching 'hurt' can never complete it by itself.
execute if entity @s[advancements={bacaptmh:weaponry/king_of_the_hill={hurt=true}}] run scoreboard players set @s bacaptmh_kh 200
execute if entity @s[advancements={bacaptmh:weaponry/king_of_the_hill={hurt=true}}] run advancement revoke @s only bacaptmh:weaponry/king_of_the_hill hurt
execute if score @s bacaptmh_kh matches 1.. run scoreboard players remove @s bacaptmh_kh 1
# Which block cell are they in? Pos is read raw and truncated, so the score only changes when
# they leave the one-block cell. Y is deliberately not part of the key: knockback lifts a player
# a fraction of a block constantly and keying on it would reset every run instantly.
scoreboard players set #mp4kx bacaptmh_tmp 0
scoreboard players set #mp4kz bacaptmh_tmp 0
execute store result score #mp4kx bacaptmh_tmp run data get entity @s Pos[0]
execute store result score #mp4kz bacaptmh_tmp run data get entity @s Pos[2]
execute unless score #mp4kx bacaptmh_tmp = @s bacaptmh_kx run scoreboard players set @s bacaptmh_kt 0
execute unless score #mp4kz bacaptmh_tmp = @s bacaptmh_kz run scoreboard players set @s bacaptmh_kt 0
scoreboard players operation @s bacaptmh_kx = #mp4kx bacaptmh_tmp
scoreboard players operation @s bacaptmh_kz = #mp4kz bacaptmh_tmp
# Two other players have to be close enough to be doing the pushing. distance=0.5.. excludes the
# defender themselves without needing an identity test.
scoreboard players set #mp4kn bacaptmh_tmp 0
execute as @a[gamemode=!spectator,gamemode=!creative,distance=0.5..12] run scoreboard players add #mp4kn bacaptmh_tmp 1
execute unless score #mp4kn bacaptmh_tmp matches 2.. run scoreboard players set @s bacaptmh_kt 0
execute if score #mp4kn bacaptmh_tmp matches 2.. if score @s bacaptmh_kh matches 1.. if predicate blazeandcave:is_on_ground run scoreboard players add @s bacaptmh_kt 1
# 1200 fast passes is 1200 ticks, one real minute. The challengers are paid as well - but
# only the ones the contest itself counted: same gamemode filters, same twelve blocks. The
# wider unfiltered grant paid any creative-mode or uninvolved bystander who happened to be
# standing there on the final tick.
execute if score @s bacaptmh_kt matches 1200.. run advancement grant @a[gamemode=!spectator,gamemode=!creative,distance=..12] only bacaptmh:weaponry/king_of_the_hill
