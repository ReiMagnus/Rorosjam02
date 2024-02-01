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
			falas = ["Parece uma pelúcia de um polvo."]
		1:
			coletavel = true
			falas = ["Esse pelúcia deve ser daquele menino, vou levar para ele."]
		_:
			falas = ["SEM FALAS"]
	if coletavel:
		falas.insert(falas.size(), "*Você pegou a pelúcia.")
