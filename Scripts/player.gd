extends CharacterBody2D

var spd = 160
var tam_tile = 64
var direction = Vector2.ZERO # direção do andar
var dir_olhar = Vector2.DOWN # direção do olhar do personagem

var cutscene = false # quando true, o player ficará parado, como para cenas de dialogo ou cutscenes

func _ready():
	Input.mouse_mode = 1
	Global.cutscene.connect(_modo_cutscene)


func _process(delta):
	_animation_player()


func _physics_process(delta):
	if !cutscene:
		_movimento()


func _movimento():
	#region Movimentação em grid (comentado) ------------------------------
	#var tile_x = snapped((position.x+tam_tile/2)/tam_tile, 0.1)
	#var tile_y = snapped((position.y+tam_tile/2)/tam_tile, 0.1)
	#
	#print("X:        " + str(position.x) +" Y:        " + str(position.y))
	#print("tile_x: " + str(tile_x, " ", tile_x*tam_tile-32) +" tile_y: " + str(tile_y, " ", tile_y*tam_tile-32))
#
	#if tile_x == int(tile_x) && tile_y == int(tile_y):
	#
		#if direction != Vector2.ZERO:
			#position.x = (tile_x*tam_tile)-tam_tile/2
			#position.y = (tile_y*tam_tile)-tam_tile/2
	#
		#direction = Vector2.ZERO
	#
		#var botoes_x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
		#var botoes_y = int(Input.is_action_pressed("move_back")) - int(Input.is_action_pressed("move_up"))
	#
		#if ((botoes_x != 0) && (botoes_y != 0)) != true:
			#teste = 0
			#if direction.y == 0:
				#direction.x = Input.get_axis("move_left", "move_right")
			#if direction.x == 0:
				#direction.y = Input.get_axis("move_up", "move_back")
			#teste = direction
		#else:
			#if teste.x != 0:
				#direction.y = Input.get_axis("move_up", "move_back")
			#elif teste.y != 0:
				#direction.x = Input.get_axis("move_left", "move_right")
	#endregion
	
	#Movimentação 8 direções ------------------------------
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	velocity = direction.normalized() * spd
	
	# Personagem olhando pros lados ------------------------------

	# Personagem olhando pros lados ------------------------------
	if direction != Vector2.ZERO:
		dir_olhar = direction
	$Area2D.position = dir_olhar * 30 # area de interagir do player
	
	move_and_slide()

func _animation_player():
	match(dir_olhar):
		Vector2.DOWN:
			$Personagem.frame = 0
		Vector2.UP:
			$Personagem.frame = 2
		Vector2.LEFT:
			$Personagem.frame = 4
		Vector2.RIGHT:
			$Personagem.frame = 6

func _modo_cutscene(modo:bool):
	cutscene = modo
