extends KinematicBody2D


const gravity = 1500
const jump = -1000
const dashx = 5
const dashy = 4.5
const FLOOR = Vector2(0,-1)
var velocity = Vector2.ZERO 
var speed = 800
var queda = gravity * 1.3
onready var animated_sprite = $AnimatedSprite
onready var timer = $Timer


	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func gravidade(velocity: Vector2):
	if velocity.y < 0:
		return gravity
	return queda
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	#caminhar no elemento
	if Input.is_action_pressed("left"):
		animated_sprite.animation = "andar"
		animated_sprite.flip_h = true
		velocity.x = -speed
		if Input.is_action_just_pressed("dash"):
			speed = 800
			speed *= dashx
			timer.start()
	elif Input.is_action_pressed("right"):
		animated_sprite.animation = "andar"
		animated_sprite.flip_h = false
		velocity.x = speed
		if Input.is_action_just_pressed("dash"):
			speed = 800
			speed *= dashx
			timer.start()
	else:
		velocity.x = 0
	
	#testes pra dash 8pad
	if Input.is_action_pressed("up"):
			animated_sprite.animation = "subir"
			if Input.is_action_just_pressed("dash"):
				velocity.y = -1500
				timer.start()

	if Input.is_action_pressed("down"):
			animated_sprite.animation = "descer"
			if Input.is_action_just_pressed("dash"):
					velocity.y = 1500
					timer.start()
		
	#pulo	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump
		
	#gravity
	if not is_on_floor():
		velocity.y += gravidade(velocity) * delta

	move_and_slide(velocity, FLOOR)


func _on_Timer_timeout():
	speed = 800
