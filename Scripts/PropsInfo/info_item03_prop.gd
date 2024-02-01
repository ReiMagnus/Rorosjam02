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
			falas = ["É uma boneca de pano com uma roupa de maid, quem deixou ela aqui?"]
		1:
			coletavel = true
			falas = ["Deve ser a boneca que o aquele menino falou, vou levar de volta para ele."]
		_:
			falas = ["SEM FALAS"]
	if coletavel:
		falas.insert(falas.size(), "*Você pegou a boneca.")
