extends KinematicBody2D

var velocity = Vector2.ZERO 
const gravity = 45
const speed = 800
const jump = -1000
const FLOOR = Vector2(0,-1)
onready var notfrieren = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	#caminhar no elemento
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump
		
	#gravity
	velocity.y += gravity

	move_and_slide(velocity, FLOOR)

