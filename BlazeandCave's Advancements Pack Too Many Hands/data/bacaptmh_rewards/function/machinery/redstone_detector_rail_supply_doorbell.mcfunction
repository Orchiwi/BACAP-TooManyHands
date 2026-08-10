# Counter doorbell for the redstone_detector_rail_supply ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_redstone_detector_rail_supply 1
advancement revoke @s only bacaptmh:machinery/redstone_detector_rail_supply_doorbell
