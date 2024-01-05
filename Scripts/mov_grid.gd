extends Node


#region Movimentação em grid (comentado) ------------------------------
	#var teste = Vector2.Zero 
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
