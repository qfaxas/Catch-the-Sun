extends CollisionShape2D

# Declare the scene variable and make it editable in the editor
export var scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Function triggered when something enters the collision area
func _on_final_fase_1_body_entered(body):
	if scene != null:
		get_tree().change_scene_to(scene)
	else:
		print("Scene not assigned!")
