extends Area2D


onready var sprite = $Sprite
onready var audio = $AudioStreamPlayer
onready var timer = $Timer

func _ready():
	sprite.animation = "pouco"


func _on_perigo_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade != 2:
		sprite.animation = "machuca"
		audio.play()
		timer.start()
		
		


func _on_Timer_timeout():
	get_tree().reload_current_scene()
