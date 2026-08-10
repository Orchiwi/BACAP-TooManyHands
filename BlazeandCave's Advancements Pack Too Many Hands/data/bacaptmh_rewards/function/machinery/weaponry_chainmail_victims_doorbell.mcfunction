# Counter doorbell for the weaponry_chainmail_victims ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_weaponry_chainmail_victims 1
advancement revoke @s only bacaptmh:machinery/weaponry_chainmail_victims_doorbell
