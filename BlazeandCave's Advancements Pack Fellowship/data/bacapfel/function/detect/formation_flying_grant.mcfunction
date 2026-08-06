# Four medium ticks is two full seconds of formation.
execute store result score #ffn bacapfel_tmp4 if entity @a[tag=bacapfel_fly,scores={bacapfel_form=4..},distance=..10]
execute if score #ffn bacapfel_tmp4 matches 3.. run advancement grant @a[tag=bacapfel_fly,scores={bacapfel_form=4..},distance=..10] only bacapfel:challenges/formation_flying
execute if score #ffn bacapfel_tmp4 matches 3.. run scoreboard players set @a[tag=bacapfel_fly,scores={bacapfel_form=4..},distance=..10] bacapfel_form 0
