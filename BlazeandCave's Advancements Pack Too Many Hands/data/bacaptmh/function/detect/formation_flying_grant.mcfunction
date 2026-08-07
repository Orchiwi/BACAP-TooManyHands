# Four medium ticks is two full seconds of formation.
execute store result score #ffn bacaptmh_tmp4 if entity @a[tag=bacaptmh_fly,scores={bacaptmh_form=4..},distance=..10]
execute if score #ffn bacaptmh_tmp4 matches 3.. run advancement grant @a[tag=bacaptmh_fly,scores={bacaptmh_form=4..},distance=..10] only bacaptmh:challenges/formation_flying
execute if score #ffn bacaptmh_tmp4 matches 3.. run scoreboard players set @a[tag=bacaptmh_fly,scores={bacaptmh_form=4..},distance=..10] bacaptmh_form 0
