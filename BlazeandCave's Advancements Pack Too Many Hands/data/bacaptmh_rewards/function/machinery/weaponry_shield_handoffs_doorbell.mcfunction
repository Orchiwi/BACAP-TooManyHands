# Counter doorbell for the weaponry_shield_handoffs ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_weaponry_shield_handoffs 1
advancement revoke @s only bacaptmh:machinery/weaponry_shield_handoffs_doorbell
