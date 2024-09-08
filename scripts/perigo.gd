extends Area2D


onready var sprite = $Sprite


func _on_perigo_body_entered(body):
	if body.name == "notfrieren" and Autoload.velocidade != 2:
		get_tree().reload_current_scene()
		
func _process(delta):
	if Autoload.velocidade == 2:
		sprite.animation = "pouco"
	else:
		sprite.animation = "machuca"
