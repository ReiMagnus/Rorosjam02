extends CharacterBody2D

var spd = 120
var direction = Vector2.ZERO # direção do andar
var dir_olhar = Vector2.DOWN # direção do olhar do personagem

var _estou_na_cutscene = false # quando true, o player ficará parado, como para cenas de dialogo ou cutscenes

var tecla1 = Vector2.ZERO # salvar a primeira tecla de movimento que apertou
var tecla2 = Vector2.ZERO # salvar a segunda            //

func _ready():
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
	direction = Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	velocity = direction.normalized() * spd
	
	#Personagem olhando pros lados (4 direções) -----------
	if direction != Vector2.ZERO:
		if direction.x == 0 or direction.y == 0:
			tecla1 = direction
			dir_olhar = tecla1
		else:
			tecla2 = direction-tecla1
			dir_olhar = tecla2
	$Area2D.position = Vector2(32, 32) + dir_olhar * 32 # area de interagir do player
	
	move_and_slide()


func _animation_player():
	match dir_olhar:
		Vector2.DOWN:
			$Sprite.frame = 0
		Vector2.UP:
			$Sprite.frame = 2
		Vector2.LEFT:
			$Sprite.frame = 4
		Vector2.RIGHT:
			$Sprite.frame = 6


func _modo_cutscene(modo:bool):
	_estou_na_cutscene = modo
