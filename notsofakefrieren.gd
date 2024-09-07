extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var notsofakefrieren = $"."
onready var animated_sprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.animation = "run"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

