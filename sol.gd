extends Node2D


onready var recarga = $recarga
onready var notfrieren = $"../notfrieren"


func _on_Area2D_body_entered(body):
	if body == notfrieren:
		recarga.start()
		print(recarga.time_left)


func _on_Area2D_body_exited(body):
	if body == notfrieren:
		recarga.stop()


func _on_recarga_timeout():
	if Autoload.poder < 3:
		Autoload.poder += 1

	
func _process(delta):
	if Autoload.velocidade != 0:
		recarga.stop()
