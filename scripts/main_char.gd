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
onready var ciclos = $CanvasLayer/ciclos
onready var timer = $Timer

	
# Called when the node enters the scene tree for the first time.
func _ready():
	ciclos.animation = "normal"
	
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
		if Autoload.velocidade == 1:
			Autoload.velocidade += 1
			ciclos.animation = "fast"
		elif Autoload.velocidade == 2:
			Autoload.velocidade = 0
			ciclos.animation = "slow"
		elif Autoload.velocidade == 0:
			Autoload.velocidade += 1
			ciclos.animation = "normal"

	move_and_slide(velocity, FLOOR)


func _on_Timer_timeout():
	speed = 800
