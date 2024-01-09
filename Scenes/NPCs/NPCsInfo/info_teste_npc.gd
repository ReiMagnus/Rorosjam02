extends Node2D

var lado_caixa_dialogo = true # false = esquerda, true =direita
var nome = "Niko"
var rosto = load("res://Assets/GUI/RostosNPCs/niko.png")

var falas = []

func _ready():
	falas = [
		"Fala 1",
		"Fala 2",
		"Fala 3",
	]


func _process(delta):
	if Input.is_action_just_pressed("cancelar"):
		if lado_caixa_dialogo:
			lado_caixa_dialogo = false
		else: 
			lado_caixa_dialogo = true
		print(lado_caixa_dialogo)
