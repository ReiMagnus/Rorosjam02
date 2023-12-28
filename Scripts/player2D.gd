extends CharacterBody2D

@export var spd = 200
var tam_tile = 60

var direction = Vector2.ZERO # direção do andar
var dir_olhar = Vector2.DOWN # direção do olhar do personagem

var teste = Vector2.ZERO

func _ready():
	Input.mouse_mode = 1
	# position.x = (position.x)/tam_tile
	# position.y = (position.y)/tam_tile


func _process(delta):
	pass


func _physics_process(delta):
	_movimento()


func _movimento():
	
	# Personagem olhando pros lados
	if direction != Vector2.ZERO:
		dir_olhar = direction
	match dir_olhar:
		Vector2.DOWN: # Olhando pra baixo
			$Personagem.frame = 0
		Vector2.UP: # Olhando pra cima
			$Personagem.frame = 2
		Vector2.LEFT: # Olhando pra esquerda
			$Personagem.frame = 4
		Vector2.RIGHT: # Olhando pra direita
			$Personagem.frame = 6
	
	# Movendo o personagem
	var tile_x = snapped((position.x+30)/tam_tile, 0.01)
	var tile_y = snapped((position.y+30)/tam_tile, 0.01)
	
	if tile_x == int(tile_x) && tile_y == int(tile_y):
		direction = Vector2.ZERO
		
		position.x = snapped(((position.x)/tam_tile)*tam_tile, 0.1)
		position.y = snapped(((position.y)/tam_tile)*tam_tile, 0.1)
		
		var botoes_x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
		var botoes_y = int(Input.is_action_pressed("move_back")) - int(Input.is_action_pressed("move_up"))
		
		if ((botoes_x != 0) && (botoes_y != 0)) != true:
			teste = 0
			if direction.y == 0:
				direction.x = Input.get_axis("move_left", "move_right")
			if direction.x == 0:
				direction.y = Input.get_axis("move_up", "move_back")
			teste = direction
		else:
			if teste.x != 0:
				direction.y = Input.get_axis("move_up", "move_back")
			elif teste.y != 0:
				direction.x = Input.get_axis("move_left", "move_right")
	
	velocity = direction.normalized() * spd
	move_and_slide()


