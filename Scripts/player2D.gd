extends CharacterBody2D

@export var spd = 200
var tam_tile = 64

var direction = Vector2.ZERO # direção do andar
var dir_olhar = Vector2.DOWN # direção do olhar do personagem

var teste = Vector2.ZERO # primeira tecla de movimentação apertada

func _ready():
	Input.mouse_mode = 1
	$Area2D.disable_mode
	# position.x = (position.x)/tam_tile
	# position.y = (position.y)/tam_tile


func _process(delta):
	pass


func _physics_process(delta):
	_movimento()


func _movimento():
	# Movendo o personagem ------------------------------
	var tile_x = snapped((position.x+tam_tile/2)/tam_tile, 0.1)
	var tile_y = snapped((position.y+tam_tile/2)/tam_tile, 0.1)
	
	# print("X:        " + str(position.x) +" Y:        " + str(position.y))
	# print("tile_x: " + str(tile_x, " ", tile_x*tam_tile-32) +" tile_y: " + str(tile_y, " ", tile_y*tam_tile-32))
	
	if tile_x == int(tile_x) && tile_y == int(tile_y):
		
		if direction != Vector2.ZERO:
			position.x = (tile_x*tam_tile)-tam_tile/2
			position.y = (tile_y*tam_tile)-tam_tile/2
		
		direction = Vector2.ZERO
		
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
	
	# Personagem olhando pros lados ------------------------------
	if direction != Vector2.ZERO:
		dir_olhar = direction
	# print($"Area2D/ColisãoFrente".position.x, " ", $"Area2D/ColisãoFrente".position.y)
	
	$"Area2D/ColisãoFrente".position = dir_olhar*48
	if $"Area2D/ColisãoFrente":
		pass
	
	match dir_olhar:
		Vector2.DOWN: # Olhando pra baixo
			$Personagem.frame = 0
		Vector2.UP: # Olhando pra cima
			$Personagem.frame = 2
		Vector2.LEFT: # Olhando pra esquerda
			$Personagem.frame = 4
		Vector2.RIGHT: # Olhando pra direita
			$Personagem.frame = 6
	
	velocity = direction * (spd)
	move_and_slide()


func _on_area_2d_body_entered(body):
	direction = Vector2.ZERO
