extends StaticBody2D

var info_npc

var modo_cutscene = false
var player_area = false

var num_fala = 0
var modo_repet = 0 # 0 = Grande, 1 = Pequeno

func _ready():
	pass

func _process(delta):
	_interagir()
	_conversando()
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scenes/Levels/menu.tscn")


func _conversando():
	if modo_cutscene:
		var info_npc = get_parent()
		$CanvasLayer/CaixaDialogo.show()
		$CanvasLayer/CaixaDialogo.lado = info_npc.lado_caixa_dialogo
		$CanvasLayer/CaixaDialogo/SpriteCaixa/RostoNPC.texture = info_npc.rosto
		$CanvasLayer/CaixaDialogo/SpriteCaixa/Falas.text = info_npc.falas[num_fala]
		$CanvasLayer/CaixaDialogo/SpriteCaixa/Nome.text = info_npc.nome
	else:
		$CanvasLayer/CaixaDialogo.hide()


func _interagir():
	if player_area:
		if Input.is_action_just_pressed("interagir"):
			if !modo_cutscene:
				_mudar_cutscene(true)
			else:
				var info_npc = get_parent()
				if !info_npc.repet is Array:
					if num_fala < len(info_npc.falas)-1:
						num_fala += 1
					else:
						num_fala = info_npc.repet
						_mudar_cutscene(false)
				else:
					if num_fala < len(info_npc.falas)-1:
						num_fala += 1
					elif num_fala < len(info_npc.repet)-len(info_npc.falas)-1:
						num_fala += 1
					else:
						num_fala = len(info_npc.falas)
						_mudar_cutscene(false)


func _mudar_cutscene(bool):
	modo_cutscene = bool
	Global.cutscene.emit(bool)


func _on_area_interagir_area_entered(area):
	player_area = true


func _on_area_interagir_area_exited(area):
	player_area = false
