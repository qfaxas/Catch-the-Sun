extends KinematicBody2D


const gravity = 1500
const jump = -1000
const dashx = 5
const dashy = 4.5
const FLOOR = Vector2(0,-1)
var velocity = Vector2.ZERO 
var speed = 800
var queda = gravity * 1.3
onready var animacao = $AnimatedSprite
onready var timer = $Timer
var lento = 0
var normal = 1
var rapido = 0

	
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
		animacao.animation = "andar"
		animacao.flip_h = true
		velocity.x = -speed
		if Input.is_action_just_pressed("dash"):
			speed = 800
			speed *= dashx
			timer.start()
	elif Input.is_action_pressed("right"):
		animacao.animation = "andar"
		animacao.flip_h = false
		velocity.x = speed
		if Input.is_action_just_pressed("dash"):
			speed = 800
			speed *= dashx
			timer.start()
	else:
		velocity.x = 0
	
	#testes pra dash 8pad
	if Input.is_action_pressed("up"):
			animacao.animation = "subir"
			if Input.is_action_just_pressed("dash"):
				velocity.y = -1500
				timer.start()

	if Input.is_action_pressed("down"):
			animacao.animation = "descer"
			if Input.is_action_just_pressed("dash"):
					velocity.y = 1500
					timer.start()
	
	#dash parado
	if Input.is_action_just_pressed("dash") and velocity.x == 0:
		if animacao.is_flipped_h():
			velocity.x = -1500 * dashx
			timer.start()
		else:
			velocity.x = 1500 * dashx
			timer.start()
			
	
	#pulo	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump
		
	#gravity
	if not is_on_floor():
		velocity.y += gravidade(velocity) * delta
		
	#ciclar velocidade
	if Input.is_action_just_pressed("vel"):
		if normal == 1:
			normal = 0
			rapido = 1
		elif rapido == 1:
			rapido = 0 
			lento = 1
		elif lento == 1:
			lento = 0
			normal = 1

	move_and_slide(velocity, FLOOR)


func _on_Timer_timeout():
	speed = 800
