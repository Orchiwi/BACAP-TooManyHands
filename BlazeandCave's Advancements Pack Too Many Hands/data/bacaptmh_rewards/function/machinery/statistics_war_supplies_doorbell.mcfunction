# Counter doorbell for the statistics_war_supplies ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_statistics_war_supplies 1
advancement revoke @s only bacaptmh:machinery/statistics_war_supplies_doorbell
