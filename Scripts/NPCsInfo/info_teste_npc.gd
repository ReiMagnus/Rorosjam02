extends Node2D

var lado_caixa_dialogo = 1 # false = esquerda, true =direita
var nome = "Niko"

var rosto = load("res://Assets/RostosNPCs/teste_rosto.png")

var falas = []
var repet # pode ser um valor int ou um array

func _ready():
	Global.cutscene.connect(_avancar_historia)
	Global.avancar_historia.connect(_escolhendo_falas)
	_escolhendo_falas()

func _avancar_historia(bool):
	if bool == false: # Colocar o historio() aqui funciona bem
		print("AAAA")
		#if Global.num_historia == 0:
			#Global.historia()

func _escolhendo_falas():
	match Global.num_historia:
		0:
			falas = [
				"Fala 1",
				"Fala 2",
				"Fala 3",
			]
			repet = 0 # Repete todas as falas acima
		1:
			falas = [
				"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
				"bbbbbbbbbbbbbbbbbbbb",
				"cccccccccccccccccccc",
				"dddddddddddddddddddd",
			]
			repet = 0 # Repete apenas a última fala
		2:
			falas = [
				"Maça",
				"Banana",
				"Uva",
			]
			repet = ["Gosto de banana"] # Fala especial
		3:
			falas = [
				"Arius",
				"Ignis",
				"Rexthor",
				"Ayla", 
				"e Kiki"
			]
			repet = ["Os Cães das Colinas", "eles são demais!!"] # Falas especiais
		_:
			falas = ["SEM FALAS"]
			repet = 0
