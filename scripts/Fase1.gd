extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var label = $pensamento/Label
onready var amogus = $panpanpanpanpanparararan/amogus
onready var sus = $panpanpanpanpanparararan/sus


# Called when the node enters the scene tree for the first time.
func _ready():
	amogus.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_pensamento_body_entered(body):
	if body.name == "notfrieren":
		label.show()

func _on_pensamento_body_exited(body):
	if body.name == "notfrieren":
		label.hide()


func _on_morte_body_entered(body):
	if body.name == "notfrieren":
		get_tree().reload_current_scene()


func _on_panpanpanpanpanparararan_body_entered(body):
	if body.name == "notfrieren":
		amogus.play()
		sus.start()


func _on_sus_timeout():
	get_tree().reload_current_scene()
