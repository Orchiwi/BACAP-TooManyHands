# Turn freshly incremented vanilla statistics into pairing windows.
# Every statistic is compared against its OWN mirror, seeded in f4_init, so nothing
# consumes another advancement's delta and no lifetime total fires a false positive.
# Runs after tick_windows, so each window survives exactly as many passes as it is set to.
# This is a medium-bucket pass, so a window can open up to nine ticks after the statistic
# rose. Only Field Medic is fast enough for that to matter, and field_medic_grant handles
# it by also accepting a still-pending bacaptmh_splash delta.
execute as @a[gamemode=!spectator] if score @s bacaptmh_splash > @s bacaptmh_splash_m run function bacaptmh:detect/mark_splash
execute as @a[gamemode=!spectator] if score @s bacaptmh_lpot > @s bacaptmh_lpot_m run function bacaptmh:detect/mark_lingering
execute as @a[gamemode=!spectator] if score @s bacaptmh_fw > @s bacaptmh_fw_m run function bacaptmh:detect/mark_firework
execute as @a[gamemode=!spectator] if score @s bacaptmh_totem > @s bacaptmh_totem_m run function bacaptmh:detect/mark_totem
execute as @a[gamemode=!spectator] if score @s bacaptmh_wbucket > @s bacaptmh_wbucket_m run function bacaptmh:detect/mark_water
execute as @a[gamemode=!spectator] if score @s bacaptmh_tchest > @s bacaptmh_tchest_m run function bacaptmh:detect/mark_tchest
