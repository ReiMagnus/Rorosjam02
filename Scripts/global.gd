extends Node

signal cutscene(bool)

var num_historia = 0

func _process(delta):
	if Input.is_action_just_pressed("cancelar"):
		num_historia += 1
		if num_historia > 4:
			num_historia = 0
		print(num_historia)
