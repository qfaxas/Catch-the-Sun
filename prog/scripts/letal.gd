extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animated_sprite = $AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Autoload.velocidade == 2:
		animated_sprite.animation = "para"
	else:
		animated_sprite.animation = "default"

func _on_letal_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade != 2:
		get_tree().reload_current_scene()
