# Run as a player with a live death window. #tc* is the collector's position.
scoreboard players operation #tdx bacaptmh_tmp = @s bacaptmh_tx
scoreboard players operation #tdx bacaptmh_tmp -= #tcx bacaptmh_tmp
scoreboard players operation #tdy bacaptmh_tmp = @s bacaptmh_ty
scoreboard players operation #tdy bacaptmh_tmp -= #tcy bacaptmh_tmp
scoreboard players operation #tdz bacaptmh_tmp = @s bacaptmh_tz
scoreboard players operation #tdz bacaptmh_tmp -= #tcz bacaptmh_tmp
execute if score #tdx bacaptmh_tmp matches -8..8 if score #tdy bacaptmh_tmp matches -8..8 if score #tdz bacaptmh_tmp matches -8..8 run scoreboard players set #taxok bacaptmh_tmp 1
execute if score #tdx bacaptmh_tmp matches -8..8 if score #tdy bacaptmh_tmp matches -8..8 if score #tdz bacaptmh_tmp matches -8..8 run tag @s add bacaptmh_taxed
