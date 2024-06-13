extends Node3D

var can_interact = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var area = get_node("Area3D")
	
	if area:
		area.body_entered.connect(_on_area_body_entered)
		area.body_exited.connect(_on_area_body_exited)
	else:
		print("No se encontro el area 3d")

func _on_area_body_entered(body):
	print("nombre: ", body.name)
	if body.name == "CharacterBody3D":
		can_interact = true

func _on_area_body_exited(body):
	if body.name == "CharacterBody3D":
		can_interact = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_interact and Input.is_action_just_pressed("interaccion"):
		print("entro en la foking interaccion")
		musica.stop()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene_to_file("res://escenas/menu_principal.tscn")


