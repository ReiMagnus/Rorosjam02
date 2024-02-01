extends Node2D

var falas = []
var coletavel = false # boolean

func _ready():
	Global.avancar_historia.connect(_escolhendo_falas)
	randomize()
	$ColorRect.hide()
	_escolhendo_falas() 


func _escolhendo_falas():
	coletavel = false
	match Global.num_historia:
		0:
			falas = ["Um livro no chão, acho que quem estava lendo não gostou muito dele."]
		1:
			coletavel = true
			falas = ["O livro que o menino falou, vou levar de volta para ele."]
		_:
			falas = ["SEM FALAS"]
	if coletavel:
		falas.insert(falas.size(), "*Você pegou o livro.")
