extends Node

signal cutscene(bool) # Signal pra mudar o modo cutscena da cena
signal avancar_historia() # Signal para indicar que o num_historia aumentou em 1

var num_historia = 0
var y_player = 0

var inventario = 0


func historia():
	num_historia += 1
	avancar_historia.emit()


#func _process(delta):
	#if Input.is_action_just_pressed("cancelar"):
		#historia()
