extends KinematicBody2D


const gravity = 450
const jump = -350
const dashx = 5
const dashy = 4.5
const FLOOR = Vector2(0,-1)
var velocity = Vector2.ZERO 
var speed = 400
var queda = gravity * 1.7
var jump_buffer = 0.1
var dashcd :bool = true
onready var animacao = $AnimatedSprite
onready var ciclos = $CanvasLayer/MarginContainer/ciclos
onready var timer = $Timer
onready var dash_cooldown = $dash_cooldown

	
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
	if velocity.x == 0 and velocity.y == 0:
		animacao.animation = "idle"
	if Input.is_action_pressed("left"):
		animacao.animation = "andar"
		animacao.flip_h = true
		velocity.x = -speed
		if Input.is_action_just_pressed("dash") and dashcd:
			speed = 400
			speed *= dashx
			timer.start()
			dash_cooldown.start()
			dashcd = false
	elif Input.is_action_pressed("right"):
		animacao.animation = "andar"
		animacao.flip_h = false
		velocity.x = speed
		if Input.is_action_just_pressed("dash") and dashcd:
			speed = 400
			speed *= dashx
			timer.start()
			dash_cooldown.start()
			dashcd = false
	else:
		velocity.x = 0
	
	#testes pra dash 8pad
	if Input.is_action_pressed("up"):
			if Input.is_action_just_pressed("dash") and dashcd:
				velocity.y = -350
				timer.start()
				dash_cooldown.start()
				dashcd = false

	if Input.is_action_pressed("down"):
			if Input.is_action_just_pressed("dash") and dashcd:
					velocity.y = 350
					timer.start()
					dash_cooldown.start()
					dashcd = false
	
	#pulo	
	if Input.is_action_just_pressed("jump"):
		jump_buffer = 0.12
	jump_buffer -= delta
	if is_on_floor() and jump_buffer > 0:
		velocity.y = jump
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = jump / 4
		
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
	speed = 400


func _on_dash_cooldown_timeout():
	dashcd = true
