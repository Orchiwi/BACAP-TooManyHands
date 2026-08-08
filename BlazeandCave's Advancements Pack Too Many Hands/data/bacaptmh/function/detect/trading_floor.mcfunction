# Runs UNGATED for every non-spectator, exactly like detect/sample. If it only ran while
# somebody still lacked the advancement, every mirror would freeze the moment the last
# holder earned it and the next delta read would be a whole lifetime total.
scoreboard players operation #b7d bacaptmh_tf = @s bacaptmh_trade
scoreboard players operation #b7d bacaptmh_tf -= @s bacaptmh_tradem
scoreboard players operation @s bacaptmh_tradem = @s bacaptmh_trade
# The delta is bounded: nobody trades a thousand times inside one five-second window, so
# anything larger is a stale mirror and is refused rather than banked.
execute if score #b7d bacaptmh_tf matches 1..1000 run scoreboard players operation @s bacaptmh_tradec += #b7d bacaptmh_tf
execute if score #b7d bacaptmh_tf matches 1..1000 run scoreboard players operation #pool bacaptmh_tf += #b7d bacaptmh_tf
