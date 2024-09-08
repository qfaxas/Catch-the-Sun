extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var label = $pensamento/Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
