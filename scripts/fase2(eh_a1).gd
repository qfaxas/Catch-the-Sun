extends Node2D

onready var tempo_morte = $tempo_morte
onready var madeira = $ponte/madeira
onready var notfrieren = $notfrieren


func _on_espinhos_body_entered(body):
	if body == notfrieren and Autoload.velocidade != 0:
		tempo_morte.start()


func _on_espinhos3_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade != 0:
		tempo_morte.start()


func _on_espinhos2_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade != 0:
		tempo_morte.start()


func _on_tempo_morte_timeout():
	get_tree().reload_current_scene()




func _on_madeira_finished():
	madeira.stop()
