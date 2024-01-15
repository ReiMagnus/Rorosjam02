extends CharacterBody2D

var spd = 160
var direction = Vector2.ZERO # direção do andar
var dir_olhar = Vector2.DOWN # direção do olhar do personagem

var _estou_na_cutscene = false # quando true, o player ficará parado, como para cenas de dialogo ou cutscenes


func _ready():
	#Input.mouse_mode = 1
	Global.cutscene.connect(_modo_cutscene)


func _process(delta):
	if !_estou_na_cutscene:
		Global.y_player = position.y
		_animation_player()


func _physics_process(delta):
	if !_estou_na_cutscene:
		_movimento()


func _movimento():
	#Movimentação 8 direções ------------------------------
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	velocity = direction.normalized() * spd

	#Personagem olhando pros lados ------------------------------
	if direction != Vector2.ZERO:
		dir_olhar = direction
		#match(direction):
			#Vector2.DOWN:
				#dir_olhar = Vector2.DOWN
			#Vector2.UP:
				#dir_olhar = Vector2.UP
			#Vector2.LEFT:
				#dir_olhar = Vector2.LEFT
			#Vector2.RIGHT:
				#dir_olhar = Vector2.RIGHT
	$Area2D.position = dir_olhar * 32 # area de interagir do player
	
	move_and_slide()


func _animation_player():
	match(direction):
		Vector2.DOWN:
			$Personagem.frame = 0
		Vector2.UP:
			$Personagem.frame = 2
		Vector2.LEFT:
			$Personagem.frame = 4
		Vector2.RIGHT:
			$Personagem.frame = 6


func _modo_cutscene(modo:bool):
	_estou_na_cutscene = modo
