extends Node2D

onready var tempo_morte = $tempo_morte
onready var madeira = $ponte/madeira
onready var notfrieren = $notfrieren
onready var popup = $Area2D/Popup
onready var label = $cara/Label
onready var teste = $cara2/teste



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


func _on_Area2D_body_entered(body):
	if body == notfrieren:
		popup.show()
		



func _on_Area2D_body_exited(body):
	if body == notfrieren:
		popup.hide()


func _on_cara_body_entered(body):
	if body == notfrieren:
		label.show()


func _on_cara_body_exited(body):
	if body == notfrieren:
		label.hide()


func _on_cara2_body_entered(body):
	if body == notfrieren:
		teste.show()


func _on_cara2_body_exited(body):
	if body == notfrieren:
		teste.hide()


func _on_morte_body_entered(body):
	if body == notfrieren:
		get_tree().reload_current_scene()
