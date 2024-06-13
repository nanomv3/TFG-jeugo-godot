extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_boton_jugar_pressed():
	if not global.mute_music:
		musica.play()
	get_tree().change_scene_to_file("res://escenas/suelo_jardin.tscn")

func _on_boton_salir_pressed():
	get_tree().quit()

func _on_boton_config_pressed():
	get_tree().change_scene_to_file("res://escenas/configuracion.tscn")
