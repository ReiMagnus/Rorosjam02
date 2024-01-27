extends Node2D

var lado_caixa_dialogo = 1 # 0 = esquerda, 1 = direita, 2 = centro
var nome
var rosto
var pontos_chaves

var falas = []
var repet # pode ser um valor int ou um array


func _ready():
	Global.avancar_historia.connect(_escolhendo_falas)
	nome = "Menino"
	rosto = load("res://Assets/RostosNPCs/teste_rosto.png")
	pontos_chaves = [0, 2]
	_escolhendo_falas()


func _escolhendo_falas():
	match Global.num_historia:
		0:
			falas = ["Olá...", "Nunca vi você antes...", "Quer ser meu amigo?"]
			repet = 0 # Falas especiais
		1:
			falas = ["Item 01", "Item 02", "Item 03", "Item 04",]
			repet = 0 # Falas especiais
		2:
			falas = ["Obrigado..."]
			repet = 0 # Falas especiais
		_:
			falas = ["SEM FALAS"]
			repet = 0
