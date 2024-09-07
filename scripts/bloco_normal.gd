extends Area2D

onready var bloco = $bloco

func _on_bloco_normal_body_entered(body):
	if (body.name == "main_char"):
		if body.normal == 1:
			bloco.collision_mask = 0
			bloco.collision_layer = 0


func _on_bloco_normal_body_exited(body):
	if (body.name == "main_char"):
		bloco.collision_mask = 1
		bloco.collision_layer = 1
