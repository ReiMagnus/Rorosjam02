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
				modo_cutscene = true
				Global.cutscene.emit(true)
			else:
				var info_npc = get_parent()
				if num_fala < len(info_npc.falas)-1:
					num_fala += 1
				else:
					num_fala = 0
					modo_cutscene = false
					Global.cutscene.emit(false)
		#if Input.is_action_just_pressed("cancelar"):
			#if modo_cutscene:
				#modo_cutscene = false
				#Global.cutscene.emit(false)


func _on_area_interagir_area_entered(area):
	player_area = true


func _on_area_interagir_area_exited(area):
	player_area = false
