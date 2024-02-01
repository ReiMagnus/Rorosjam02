extends Node

func _ready():
	$SomDespertador.play()

func _on_timer_timeout():
	$MeninoNPC/npc_base.player_area = true
	$MeninoNPC/npc_base.modo_cutscene = true
	$MeninoNPC/npc_base._conversando()
