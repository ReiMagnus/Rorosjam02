extends Node2D

var falas = []
var coletavel = false # boolean

func _ready():
	Global.avancar_historia.connect(_escolhendo_falas)
	randomize()
	$ColorRect.color = Color.GREEN
	_escolhendo_falas() 


func _escolhendo_falas():
	coletavel = false
	match Global.num_historia:
		0:
			falas = ["item genéricoo"]
		1:
			coletavel = true
			falas = ["item genérico"]
		_:
			falas = ["SEM FALAS"]
	if coletavel:
		falas.insert(falas.size(), "*Você pegou esse item")
