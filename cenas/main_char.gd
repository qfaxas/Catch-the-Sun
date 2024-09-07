extends KinematicBody2D

var velocity = Vector2.ZERO 
const gravity = 45
var speed = 800
const jump = -1000
const dash = 4
const FLOOR = Vector2(0,-1)
onready var sprite = $"../StaticBody2D/Sprite"
onready var timer = $"../Timer"


	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
#coisas do dash
func _on_Timer_timeout():
	speed = 800
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	#caminhar no elemento
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		sprite.flip_h
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump
		
	#gravity
	velocity.y += gravity

	#dash
	if Input.is_action_just_pressed("dash"):
		speed *= dash	
		timer.start()

	move_and_slide(velocity, FLOOR)




