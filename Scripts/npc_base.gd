extends StaticBody2D

signal parar_player

var dialogo = false
var player_area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_interagir()


func _interagir():
	if Input.is_action_just_pressed("interagir") and player_area:
		print("AAA")
		if !dialogo:
			dialogo = true
			Global.parado = true
	

func _on_area_interagir_area_entered(area):
	player_area = true


func _on_area_interagir_area_exited(area):
	player_area = false
