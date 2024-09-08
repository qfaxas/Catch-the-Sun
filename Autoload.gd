extends Node


var velocidade = 1
var poder = 3
onready var tempoder = $tempoder

func _on_Autoload_script_changed():
	if velocidade == 2:
		tempoder.start()

func _on_tempoder_timeout():
	poder -= 1
