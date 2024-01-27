extends Node

signal cutscene(bool) # Signal pra mudar o modo cutscena da cena
signal avancar_historia() # Signal para indicar que o num_historia aumentou em 1

var num_historia = 0
var y_player = 0

var inventario = 0


func historia():
	num_historia += 1
	avancar_historia.emit()


func _process(delta):
	print(num_historia)
	match num_historia:
		1:
			if inventario == 4:
				historia()
		3:
			get_tree().change_scene_to_file("res://Scenes/Levels/level_quarto_menino.tscn")
