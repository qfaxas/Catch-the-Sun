extends Area2D

onready var ponta = $ponta



func _on_ponte_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade != 0:
		ponta.collision_layer = 0
		ponta.collision_mask = 0
	


func _on_ponte_body_exited(body):
	ponta.collision_layer = 1
	ponta.collision_mask = 1
	
