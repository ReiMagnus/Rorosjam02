extends Node2D

var lado_caixa_dialogo = 1 # false = esquerda, true =direita
var nome = "Niko"

var rosto = load("res://Assets/RostosNPCs/teste_rosto.png")

var falas = []
var repet # pode ser um valor int ou um array

func _ready():
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
				"Fala 56",
				"Fala 81",
				"Fala 24",
				"Fala 64",
			]
			repet = len(falas)-1 # Repete apenas a última fala
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
