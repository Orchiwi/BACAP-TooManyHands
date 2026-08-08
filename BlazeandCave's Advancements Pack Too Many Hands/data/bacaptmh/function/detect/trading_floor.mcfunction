# Runs UNGATED for every non-spectator, exactly like detect/sample. If it only ran while
# somebody still lacked the advancement, every mirror would freeze the moment the last
# holder earned it and the next delta read would be a whole lifetime total.
# The shared scratch below is zeroed first and both copies are gated on the source
# and mirror actually being SET. `scoreboard players operation` does not run at all
# while either side is unset, and a statistic has no entry until the player first
# performs the action - so an untouched player used to inherit the delta computed
# for whoever was iterated before them in the same sweep. `matches 0..` is false on
# an unset score, which is what makes the gate work.
scoreboard players set #b7d bacaptmh_tf 0
execute if score @s bacaptmh_trade matches 0.. if score @s bacaptmh_tradem matches 0.. run scoreboard players operation #b7d bacaptmh_tf = @s bacaptmh_trade
execute if score @s bacaptmh_trade matches 0.. if score @s bacaptmh_tradem matches 0.. run scoreboard players operation #b7d bacaptmh_tf -= @s bacaptmh_tradem
execute if score @s bacaptmh_trade matches 0.. run scoreboard players operation @s bacaptmh_tradem = @s bacaptmh_trade
# The delta is bounded: nobody trades a thousand times inside one five-second window, so
# anything larger is a stale mirror and is refused rather than banked.
execute if score #b7d bacaptmh_tf matches 1..1000 run scoreboard players operation @s bacaptmh_tradec += #b7d bacaptmh_tf
execute if score #b7d bacaptmh_tf matches 1..1000 run scoreboard players operation #pool bacaptmh_tf += #b7d bacaptmh_tf
