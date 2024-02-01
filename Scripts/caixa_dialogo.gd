extends Control

var fala_atual = ""
var fala_na_tela = ""

func _ready():
	hide()
	$Timer.start()

func _process(delta):
	$SpriteCaixa/Falas.text = fala_na_tela


func avancar_falas():
	if fala_atual != fala_na_tela:
		fala_na_tela = fala_atual
		return 0
	else:
		fala_na_tela = ""
		return 1


func _on_timer_timeout(): # Escrevendo o texto
	if fala_atual != fala_na_tela:
		fala_na_tela += fala_atual[len(fala_na_tela)]


func config_caixa_dialogo(lado:int):
	match lado:
		0: # Esquerda
			$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoE.png")
			$SpriteCaixa/Falas.size = Vector2(428, 80)
			$SpriteCaixa/RostoNPC.position = Vector2(16, 16)
			$SpriteCaixa/Falas.position = Vector2(134, 32)
			$SpriteCaixa/Nome.position = Vector2(128, 14)
			$SpriteCaixa/Nome.horizontal_alignment = 0
		
		1: # Direita
			$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoD.png")
			$SpriteCaixa/Falas.size = Vector2(428, 80)
			$SpriteCaixa/RostoNPC.position = Vector2(464, 16)
			$SpriteCaixa/Falas.position = Vector2(22, 32)
			$SpriteCaixa/Nome.position = Vector2(368, 14)
			$SpriteCaixa/Nome.horizontal_alignment = 2
			
		2: # Limpo
			$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoLimpo.png")
			$SpriteCaixa/Falas.size = Vector2(500, 80)
			$SpriteCaixa/RostoNPC.position = Vector2(-128, 0)
			$SpriteCaixa/Falas.position = Vector2(38, 24)
			$SpriteCaixa/Nome.position = Vector2(-128, 0)
			$SpriteCaixa/Nome.horizontal_alignment = 0
