extends KinematicBody2D

var velocity = Vector2.ZERO 
const gravity = 1000
const speed = 800
const jump = -1000
const FLOOR = Vector2(0,-1)
onready var notfrieren = $notfrieren

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	#caminhar no elemento
	if Input.is_action_just_pressed("left"):
		velocity.x = -speed
	elif Input.is_action_just_pressed("right"):
		velocity.x = speed
	else:
		return 0
		
	#gravity

	move_and_slide(velocity, FLOOR)
