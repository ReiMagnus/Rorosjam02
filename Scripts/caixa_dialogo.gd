extends Control

var lado = 0 # 0 = esquerda, 1 = direita, 2 = Limpo


func _ready():
	hide()


func _process(delta):
	_config_caixa_dialogo()


func _config_caixa_dialogo():
	match lado:
		0: # Esquerda
			$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoE.png")
			$SpriteCaixa/RostoNPC.position = Vector2(16, 16)
			$SpriteCaixa/Falas.position = Vector2(128, 32)
			$SpriteCaixa/Nome.position = Vector2(128, 14)
			$SpriteCaixa/Nome.horizontal_alignment = 0
		
		1: # Direita
			$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoD.png")
			$SpriteCaixa/RostoNPC.position = Vector2(464, 16)
			$SpriteCaixa/Falas.position = Vector2(16, 32)
			$SpriteCaixa/Nome.position = Vector2(368, 14)
			$SpriteCaixa/Nome.horizontal_alignment = 2
			
		2: # Limpo
			$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoLimpo.png")
			$SpriteCaixa/RostoNPC.position = Vector2(-128, 0)
			$SpriteCaixa/Falas.position = Vector2(32, 24)
			$SpriteCaixa/Nome.position = Vector2(-128, 0)
			$SpriteCaixa/Nome.horizontal_alignment = 0
