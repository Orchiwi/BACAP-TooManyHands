# Counter doorbell for the weaponry_mace_wounds ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_weaponry_mace_wounds 1
advancement revoke @s only bacaptmh:machinery/weaponry_mace_wounds_doorbell
