extends StaticBody2D

var info_npc

var modo_cutscene = false
var player_area = false

var num_fala = 0
var modo_repet = 0 # 0 = Grande, 1 = Pequeno

func _ready():
	info_npc = get_parent()


func _process(delta):
	if player_area:
		_interagir()
		_conversando()


func _conversando():
	if modo_cutscene:
		$CanvasLayer/CaixaDialogo.show()
		$CanvasLayer/CaixaDialogo.lado = info_npc.lado_caixa_dialogo
		$CanvasLayer/CaixaDialogo/SpriteCaixa/Nome.text = info_npc.nome
		$CanvasLayer/CaixaDialogo/SpriteCaixa/RostoNPC.texture = info_npc.rosto
		
		if num_fala < len(info_npc.falas):
			$CanvasLayer/CaixaDialogo/SpriteCaixa/Falas.text = info_npc.falas[num_fala]
		else:
			$CanvasLayer/CaixaDialogo/SpriteCaixa/Falas.text = info_npc.repet[num_fala-len(info_npc.falas)-1]
		
	else:
		$CanvasLayer/CaixaDialogo.hide()


func _interagir():
	if Input.is_action_just_pressed("interagir"):
		if !modo_cutscene:
			_mudar_cutscene(true)
		else:
			if info_npc.repet is int: # -- Falas de repetição 
				if num_fala < len(info_npc.falas)-1:
					num_fala += 1
				else:
					num_fala = info_npc.repet
					_mudar_cutscene(false)
			else: # ---------------------- Falas especiais
				if num_fala < len(info_npc.falas)-1:
					num_fala += 1
				elif num_fala > len(info_npc.falas) and num_fala < (len(info_npc.falas)+len(info_npc.repet)):
					num_fala += 1
				else:
					num_fala = len(info_npc.falas)+1
					_mudar_cutscene(false)


func _mudar_cutscene(bool):
	modo_cutscene = bool
	Global.cutscene.emit(bool)


func _on_area_interagir_area_entered(area):
	player_area = true


func _on_area_interagir_area_exited(area):
	player_area = false
