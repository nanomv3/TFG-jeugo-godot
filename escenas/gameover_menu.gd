extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if not global.mute_music:
		MusicaMenus.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_return_to_menu_pressed():
	MusicaMenus.stop()
	get_tree().change_scene_to_file("res://escenas/menu_principal.tscn")
