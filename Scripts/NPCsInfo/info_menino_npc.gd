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
	if Global.num_historia == 4:
		rosto = load("res://Assets/RostosNPCs/MeninoRosto.png")
	else:
		rosto = load("res://Assets/RostosNPCs/MeninoRostoSonho.png")
	pontos_chaves = [0, 2, 4]
	_escolhendo_falas()


func _escolhendo_falas():
	match Global.num_historia:
		0:
			falas = ["...", "Ah... olá.", "Não consegui achar as minhas coisas...", "Você pode achar elas para mim?"]
			repet = 0 # Falas especiais
		1:
			falas = ["Eu acho que era...", "Uma pelúcia...", "Um livro...", "Minha mochila...", "e uma boneca..."]
			repet = 1 # Falas especiais
		2:
			falas = ["Ah...", "Você achou as minhas coisas.", "Muito obrigado.", "Mas... eu nunca te vi aqui antes...", "Você deve ser novo, qual o seu nome?"]
			repet = 0 # Falas especiais
		4:
			falas = ["...", "Ah...", "Mais um dia...", "Mas...", "Foi diferente de vez.", "Quem era aquela pessoa?"]
			repet = 0 # Falas especiais
		_:
			falas = ["SEM FALAS"]
			repet = 0
