extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_boton_volver_pressed():
	get_tree().change_scene_to_file("res://escenas/menu_principal.tscn")


func _on_boton_1_pressed():
	if global.mute_music:
		global.mute_music = false
		$VBoxContainer/musica.text = "music: on"
	else:
		global.mute_music = true
		$VBoxContainer/musica.text = "music: off"


func _on_boton_2_pressed():
	print("music: ", global.mute_music)
	if global.awsd:
		global.awsd = false
		$VBoxContainer/awsd.text = "controls: arrows"
	else:
		global.awsd = true
		$VBoxContainer/awsd.text = "controls: awsd keys"
