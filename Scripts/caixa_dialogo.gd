extends Control

var lado = false # false = esquerda, true =direita


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_config_caixa_dialogo()


func _config_caixa_dialogo():
	pass
	if !lado:  # Esquerda
		$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoE.png")
		$SpriteCaixa/RostoNPC.position = Vector2(16, 16)
		$SpriteCaixa/Falas.position = Vector2(128, 32)
		$SpriteCaixa/Nome.position = Vector2(128, 14)
		$SpriteCaixa/Nome.horizontal_alignment = 0
		
	elif lado: # Direita
		$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoD.png")
		$SpriteCaixa/RostoNPC.position = Vector2(464, 16)
		$SpriteCaixa/Falas.position = Vector2(16, 32)
		$SpriteCaixa/Nome.position = Vector2(368, 14)
		$SpriteCaixa/Nome.horizontal_alignment = 2
		
