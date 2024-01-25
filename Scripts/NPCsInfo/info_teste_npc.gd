extends Node2D

var lado_caixa_dialogo = 1 # 0 = esquerda, 1 = direita, 2 = centro
var nome
var rosto
var pontos_chaves

var falas = []
var repet # pode ser um valor int ou um array


func _ready():
	Global.avancar_historia.connect(_escolhendo_falas)
	
	nome = "Niko"
	rosto = load("res://Assets/RostosNPCs/teste_rosto.png")
	pontos_chaves = [0, 2, 3, 4]
	_escolhendo_falas()


func _escolhendo_falas():
	match Global.num_historia:
		0:
			falas = ["Arius", "Ignis", "Rexthor", "Ayla",  "e Kiki"]
			repet = ["Os Cães das Colinas", "eles são demais!!"] # Falas especiais
		_:
			falas = ["SEM FALAS"]
			repet = 0
