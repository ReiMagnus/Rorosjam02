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
			falas = ["Alguém deixou uma mochila aqui.", "Não tem nada dentro, mas parece estar bem usada."]
		1:
			coletavel = true
			falas = ["Aqui está a mochila daquele menino, vou levar de volta para ele."]
		_:
			falas = ["SEM FALAS"]
	if coletavel:
		falas.insert(falas.size(), "*Você pegou a mochila.")
