extends KinematicBody2D


const gravity = 450
const jump = -350
const dashx = 5
const dashy = 4.5
const FLOOR = Vector2(0,-1)
var velocity = Vector2.ZERO 
var speed = 400
var queda = gravity * 2.3
var jump_buffer = 0.1
var dashcd :bool = true
onready var animacao = $AnimatedSprite
onready var ciclos = $CanvasLayer/MarginContainer/ciclos
onready var timer = $Timer
onready var dash_cooldown = $dash_cooldown
onready var texto = $texto
onready var panel = $CanvasLayer/MarginContainer/Panel
onready var energia = $CanvasLayer/MarginContainer/energia
onready var panel_2 = $CanvasLayer/MarginContainer/Panel2


	
# Called when the node enters the scene tree for the first time.
func _ready():
	Autoload.poder = 3
	Autoload.velocidade = 1
	ciclos.animation = "normal"
	
func gravidade(velocity: Vector2):
	if velocity.y < 0:
		return gravity
	return queda
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	#animacoes
	if is_on_floor():
		if velocity.x == 0:
			animacao.animation = "idle"
		elif velocity.x > 0:
			animacao.flip_h = false
			animacao.animation = "andar"
		else:
			animacao.flip_h = true
			animacao.animation = "andar"
	elif velocity.y < 0:
		animacao.animation = "pular"
	else:
		animacao.animation = "cair"
	
	#de ciclos
	if Autoload.velocidade == 1:
		ciclos.animation = "normal"
		
	#TODO resolver isso aq	
	if Autoload.poder == 0 and Autoload.velocidade == 2:
			panel_2.show()
			texto.start()
	
	#caminhar no elemento
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		if Input.is_action_just_pressed("dash") and dashcd:
			if Input.is_action_pressed("up"):
				velocity.y = -450
			if Input.is_action_pressed("down"):
				velocity.y = 450
			speed = 400
			speed *= dashx
			timer.start()
			dash_cooldown.start()
			Autoload.poder -= 1
			dashcd = false
	elif Input.is_action_pressed("right"):
		velocity.x = speed
		if Input.is_action_just_pressed("dash") and dashcd:
			if Input.is_action_pressed("up"):
				velocity.y = -450
			if Input.is_action_pressed("down"):
				velocity.y = 450
			speed = 400
			speed *= dashx
			timer.start()
			dash_cooldown.start()
			Autoload.poder -= 1
			dashcd = false
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("up"):
			if Input.is_action_just_pressed("dash") and dashcd:
				velocity.y = -450
				timer.start()
				dash_cooldown.start()
				dashcd = false

	if Input.is_action_pressed("down"):
			if Input.is_action_just_pressed("dash") and dashcd:
					velocity.y = 450
					timer.start()
					dash_cooldown.start()
					dashcd = false
	
	#pulo	
	if Input.is_action_just_pressed("jump"):
		jump_buffer = 0.12
	jump_buffer -= delta
	if is_on_floor() and jump_buffer > 0:
		velocity.y = jump
	if (Input.is_action_just_released("jump") and velocity.y < 0) or is_on_ceiling():
		velocity.y = jump / 4
		
	#gravity
	if not is_on_floor():
		velocity.y += gravidade(velocity) * delta
	
	move_and_slide(velocity, FLOOR)
	
	#ciclar velocidade
	if Input.is_action_just_pressed("vel"):
		if Autoload.poder == 0:
			if Autoload.velocidade == 1:
				panel.show()
				texto.start()
				Autoload.velocidade = 0
				ciclos.animation = "slow"
			else:
				Autoload.velocidade = 1
				ciclos.animation = "normal"
				
		elif Autoload.velocidade == 1:
			Autoload.velocidade += 1
			ciclos.animation = "fast"
		elif Autoload.velocidade == 2:
			Autoload.velocidade = 0
			ciclos.animation = "slow"
		elif Autoload.velocidade == 0:
			Autoload.velocidade += 1
			ciclos.animation = "normal"
	
	#ver energia
	if Autoload.poder == 3:
		energia.animation = "bom"
	elif Autoload.poder == 2:
		energia.animation = "medio"
	elif Autoload.poder == 1:
		energia.animation = "pouco"
	else:
		energia.animation = "vazio"
		Autoload.tempoder.stop()
	
	if Autoload.poder <= 0:
		Autoload.poder = 0
		dash_cooldown.start()
	
	#teste/apagar dps
	#print("velocidade = ", Autoload.velocidade, "\npoder = ", Autoload.poder)
	


#-----------------------------------------------------------------

func _on_Timer_timeout():
	speed = 400


func _on_dash_cooldown_timeout():
	if is_on_floor():
		dashcd = true
	else:
		dash_cooldown.start()

func _on_texto_timeout():
	panel.hide()
	panel_2.hide()
