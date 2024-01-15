extends StaticBody2D

var info_npc

var modo_cutscene = false
var player_area = false

var num_fala = 0
var modo_repet = 0 # 0 = Grande, 1 = Pequeno

func _ready():
	info_npc = get_parent()
	$CanvasLayer/CaixaDialogo.config_caixa_dialogo(info_npc.lado_caixa_dialogo)


func _process(delta):
	z_index_player()
	if player_area:
		_interagir()
		_conversando()

func _conversando():
	if modo_cutscene:
		$CanvasLayer/CaixaDialogo.show()
		$CanvasLayer/CaixaDialogo/SpriteCaixa/Nome.text = info_npc.nome
		$CanvasLayer/CaixaDialogo/SpriteCaixa/RostoNPC.texture = info_npc.rosto
		if num_fala < len(info_npc.falas):
			$CanvasLayer/CaixaDialogo.fala_atual = info_npc.falas[num_fala]
		else:
			$CanvasLayer/CaixaDialogo.fala_atual = info_npc.repet[num_fala-len(info_npc.falas)-1]
	else:
		$CanvasLayer/CaixaDialogo.hide()


func _interagir():
	if Input.is_action_just_pressed("interagir"):
		if !modo_cutscene:
			_mudar_cutscene(true)
			$CanvasLayer/CaixaDialogo.fala_na_tela = ""
		else:
			num_fala += $CanvasLayer/CaixaDialogo.avancar_falas()
			if info_npc.repet is int: # -- Falas de repetição 
				if  num_fala == len(info_npc.falas):
					num_fala = info_npc.repet
					_mudar_cutscene(false)
			else: # ---------------------- Falas especiais
				if  num_fala == len(info_npc.falas) or num_fala > (len(info_npc.falas)+len(info_npc.repet)):
					num_fala = len(info_npc.falas)+1
					_mudar_cutscene(false)


func _mudar_cutscene(bool):
	modo_cutscene = bool
	Global.cutscene.emit(bool)


func _on_area_interagir_area_entered(area):
	player_area = true


func _on_area_interagir_area_exited(area):
	player_area = false


func z_index_player():
	if Global.y_player > get_parent().position.y:
		get_parent().z_index = 0
	else:
		get_parent().z_index = 1
