extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()

func _on_new_game_btn_pressed():
	get_tree().change_scene("res://cenas/fase2(eh_a1).tscn")
