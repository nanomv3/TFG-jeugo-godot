extends Node3D

var ventana

# Called when the node enters the scene tree for the first time.
func _ready():
	ventana = get_node("Window")
	if ventana:
		ventana.hide()
	else:
		print("No se encontró el nodo Window")
	
	var area = get_node("Area3D")
	
	if area:
		area.body_entered.connect(_on_area_body_entered)
		area.body_exited.connect(_on_area_body_exited)
	else:
		print("No se encontro el area 3d")

# Método que se llama cuando un cuerpo entra en el Area3D
func _on_area_body_entered(body):
	print("nombre: ", body.name)
	if body.name == "CharacterBody3D":
		$CanvasLayer/ColorRect.visible = true
		$CanvasLayer/Label.visible = true
		$CanvasLayer/Label2.visible = true
		$CanvasLayer/Label3.visible = true
		$CanvasLayer/VBoxContainer.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if global.pass_scene == 1:
			$CanvasLayer/ColorRect.visible = false
			$CanvasLayer/Label.visible = false
			$CanvasLayer/Label2.visible = false
			$CanvasLayer/Label3.visible = false
			$CanvasLayer/VBoxContainer.visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			global.pass_scene = 0
			get_tree().change_scene_to_file("res://escenas/laberinto.tscn")
		elif global.pass_scene == -1:
			$CanvasLayer/ColorRect.visible = false
			$CanvasLayer/Label.visible = false
			$CanvasLayer/Label2.visible = false
			$CanvasLayer/Label3.visible = false
			$CanvasLayer/VBoxContainer.visible = false
			musica.stop()
			global.pass_scene = 0
			get_tree().change_scene_to_file("res://escenas/menu_principal.tscn")

# Método que se llama cuando un cuerpo sale del Area3D
func _on_area_body_exited(body):
	if body.name == "CharacterBody3D":
		$CanvasLayer/ColorRect.visible = false
		$CanvasLayer/Label.visible = false
		$CanvasLayer/Label2.visible = false
		$CanvasLayer/Label3.visible = false
		$CanvasLayer/VBoxContainer.visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
