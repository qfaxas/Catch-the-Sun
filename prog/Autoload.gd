extends Node

var velocidade = 1 setget settar
var poder = 3 setget temporal
onready var tempoder = $tempoder 

func settar(novo):
	velocidade = novo
	print("velocidade = ", velocidade, "\npoder = ", poder)
	if velocidade == 2:
		tempoder.start()
	else:
		tempoder.stop()

func temporal(novoer):
	poder = novoer
	if poder == 0 and velocidade == 2:
		velocidade = 1
		tempoder.stop()

func _on_tempoder_timeout():
	self.poder -= 1
