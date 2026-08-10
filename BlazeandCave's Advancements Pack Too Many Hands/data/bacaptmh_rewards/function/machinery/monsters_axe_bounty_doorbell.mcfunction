# Counter doorbell for the monsters_axe_bounty ladder. Bump, then revoke so the
# criterion can fire again. Nothing here is shown to the player, and it
# deliberately does NOT call the fanpack macro, so it never scores.
scoreboard players add @s bacaptmh_c_monsters_axe_bounty 1
advancement revoke @s only bacaptmh:machinery/monsters_axe_bounty_doorbell
