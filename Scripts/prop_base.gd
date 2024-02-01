extends StaticBody2D

var info_prop

var modo_cutscene = false
var player_area = false

var num_fala = 0
var modo_repet = 0 # 0 = Grande, 1 = Pequeno

func _ready():
	info_prop = get_parent()
	$CanvasLayer/CaixaDialogo.config_caixa_dialogo(2)


func _process(delta):
	z_index_player()
	if player_area:
		_interagir()
		_conversando()


func _conversando():
	if modo_cutscene:
		$CanvasLayer/CaixaDialogo.show()
		$CanvasLayer/CaixaDialogo.fala_atual = info_prop.falas[num_fala]
		print($CanvasLayer/CaixaDialogo/SpriteCaixa/Falas  .size)
	else:
		$CanvasLayer/CaixaDialogo.hide()


func _interagir():
	if Input.is_action_just_pressed("interagir"):
		if !modo_cutscene:
			_mudar_cutscene(true)
			$CanvasLayer/CaixaDialogo.fala_na_tela = ""
		else:
			num_fala += $CanvasLayer/CaixaDialogo.avancar_falas()
			if  num_fala == len(info_prop.falas):
				num_fala = 0
				_mudar_cutscene(false)


func _mudar_cutscene(bool):
	modo_cutscene = bool
	Global.cutscene.emit(bool)
	if info_prop.coletavel and bool == false:
		Global.inventario += 1
		get_parent().queue_free()


func _on_area_interagir_area_entered(area):
	player_area = true


func _on_area_interagir_area_exited(area):
	player_area = false


func z_index_player():
	if Global.y_player > get_parent().position.y:
		get_parent().z_index = 0
	else:
		get_parent().z_index = 1
