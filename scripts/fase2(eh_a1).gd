extends Node2D

onready var tempo_morte = $tempo_morte


func _on_espinhos_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade != 0:
		tempo_morte.start()


func _on_espinhos3_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade != 0:
		tempo_morte.start()


func _on_espinhos2_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade != 0:
		tempo_morte.start()


func _on_tempo_morte_timeout():
	get_tree().reload_current_scene()
