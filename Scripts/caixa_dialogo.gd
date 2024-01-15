extends Control

var fala_atual = ""
var fala_na_tela = ""

func _ready():
	hide()


func _process(delta):
	$SpriteCaixa/Falas.text = fala_na_tela
	if $Timer.is_stopped():
		$Timer.start()


func avancar_falas():
	if fala_atual != fala_na_tela:
		fala_na_tela = fala_atual
		return 0
	else:
		$Timer.stop()
		fala_na_tela = ""
		return 1


func _on_timer_timeout():
	if fala_atual != fala_na_tela:
		#print(fala_atual[len(fala_na_tela)])
		fala_na_tela += fala_atual[len(fala_na_tela)]


func config_caixa_dialogo(lado:int):
	match lado:
		0: # Esquerda
			$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoE.png")
			$SpriteCaixa/RostoNPC.position = Vector2(16, 16)
			$SpriteCaixa/Falas.position = Vector2(130, 32)
			$SpriteCaixa/Nome.position = Vector2(128, 14)
			$SpriteCaixa/Nome.horizontal_alignment = 0
		
		1: # Direita
			$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoD.png")
			$SpriteCaixa/RostoNPC.position = Vector2(464, 16)
			$SpriteCaixa/Falas.position = Vector2(18, 32)
			$SpriteCaixa/Nome.position = Vector2(368, 14)
			$SpriteCaixa/Nome.horizontal_alignment = 2
			
		2: # Limpo
			$SpriteCaixa.texture = load("res://Assets/GUI/caixa_dialogoLimpo.png")
			$SpriteCaixa/RostoNPC.position = Vector2(-128, 0)
			$SpriteCaixa/Falas.position = Vector2(34, 24)
			$SpriteCaixa/Nome.position = Vector2(-128, 0)
			$SpriteCaixa/Nome.horizontal_alignment = 0
