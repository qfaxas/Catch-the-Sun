extends Node

var velocidade = 1 setget settar
var poder = 3 
onready var tempoder = $tempoder

func settar(novo):
	print("teste")
	velocidade = novo
	if velocidade == 2:
		tempoder.start()


func _on_tempoder_timeout():
	poder -= 1
