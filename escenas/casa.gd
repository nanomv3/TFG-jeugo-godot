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
		#area.body_exited.connect(_on_area_body_exited)
	else:
		print("No se encontro el area 3d")

# Método que se llama cuando un cuerpo entra en el Area3D
func _on_area_body_entered(body):
	print("nombre: ", body.name)
	if body.name == "CharacterBody3D":
		#mostrar_popup()
		get_tree().change_scene_to_file("res://escenas/laberinto.tscn")

# Método que se llama cuando un cuerpo sale del Area3D
func _on_area_body_exited(body):
	if body.name == "CharacterBody3D":
		ocultar_ventana()

# Método para mostrar el Popup
func mostrar_popup():
	print("entro en mostrar popup")
	if ventana:
		ventana.popup_centered()
	else:
		print("No se encontró el nodo Window para mostrar")

# Método para ocultar la ventana
func ocultar_ventana():
	print("entro en ocultar popup")
	if ventana:
		ventana.hide()
	else:
		print("No se encontró el nodo Window para ocultar")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
