# Counter doorbell for the weaponry_diamond_axe_hits ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_weaponry_diamond_axe_hits 1
advancement revoke @s only bacaptmh:machinery/weaponry_diamond_axe_hits_doorbell
