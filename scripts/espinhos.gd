extends Area2D


onready var timer = $Timer
onready var notfrieren = $"../notfrieren"





func _on_espinhos_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade != 0:
		print("teste")
		
		
	

func _on_Timer_timeout():
	get_tree().reload_current_scene()
