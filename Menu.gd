extends Control

onready var credits = $credits

var selectron = 0
onready var jog = $CanvasLayer/TextureRect2
onready var credit = $CanvasLayer/TextureRect3
onready var sai = $CanvasLayer/TextureRect4


func _process(delta):
	if selectron == 0:
		if Input.is_action_just_pressed("up"):
			jog.hide()
			sai.show()
			selectron = 2
		elif Input.is_action_just_pressed("down"):
			jog.hide()
			credit.show()
			selectron = 1
	elif selectron == 1:
		if Input.is_action_just_pressed("up"):
			credit.hide()
			jog.show()
			selectron = 0
		elif Input.is_action_just_pressed("down"):
			credit.hide()
			sai.show()
			selectron = 2
	elif selectron == 2:
		if Input.is_action_just_pressed("up"):
			sai.hide()
			credit.show()
			selectron = 1
		elif Input.is_action_just_pressed("down"):
			sai.hide()
			jog.show()
			selectron = 0
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_credits_pressed():
	get_tree().change_scene("res://cenas/creditos.tscn")
