extends StaticBody2D

var modo_cutscene = false
var player_area = false
var personagem = null

# Called when the node enters the scene tree for the first time.
func _ready():
	personagem = get_parent()
	print(personagem.rosto)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_interagir()
	_conversando()


func _conversando():
	if modo_cutscene:
		$CanvasLayer/CaixaDialogo.show()
	else:
		$CanvasLayer/CaixaDialogo.hide()


func _interagir():
	if player_area:
		if Input.is_action_just_pressed("interagir"):
			if !modo_cutscene:
				modo_cutscene = true
				Global.cutscene.emit(true)
		if Input.is_action_just_pressed("cancelar"):
			if modo_cutscene:
				modo_cutscene = false
				Global.cutscene.emit(false)

func _on_area_interagir_area_entered(area):
	player_area = true


func _on_area_interagir_area_exited(area):
	player_area = false
