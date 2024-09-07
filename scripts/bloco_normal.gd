extends Area2D

onready var bloco = $bloco
onready var notfrieren = $"../notfrieren"


func _on_bloco_normal_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade == 1:
		bloco.collision_layer = 0
		bloco.collision_mask = 0


func _on_bloco_normal_body_exited(body):
	bloco.collision_layer = 1
	bloco.collision_mask = 1

