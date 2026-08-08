# Body Count. @s is a non-spectator who has died at least ten times since install
# (bacaptmh_bcd, this batch's own private deathCount objective, seeded to 0 in
# bacaptmh:seed) and does not hold the advancement yet. The advancement itself is an
# impossible-only shell, so nothing can complete it except this function.
#
# 'execute store result ... if entity @a[...]' returns the match COUNT. A plain
# 'if entity @a[limit=5]' would only ever tell us that at least one player matched,
# which guards nothing.
scoreboard players set #bodycount bacaptmh_mpf2 0
execute store result score #bodycount bacaptmh_mpf2 if entity @a[gamemode=!spectator,scores={bacaptmh_bcd=10..}]

# Five of them and every one of the five is paid, not only whoever tripped the check -
# Cooperative Mode is off, so the grant has to name them all.
execute if score #bodycount bacaptmh_mpf2 matches 5.. run advancement grant @a[gamemode=!spectator,scores={bacaptmh_bcd=10..}] only bacaptmh:statistics/body_count
