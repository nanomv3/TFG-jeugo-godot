extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var x_sensibility = 0.0005
var y_sensibility = 0.001

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#_on_CollisionShape3D_body_entered(house)

# Función para detectar colisiones
#func _on_CollisionShape3D_body_entered(body):
	#if body.name == "escaleras":
		#var popup = Popup.new()
		#popup.title = "Hola Mundo"
		#popup.popup_()
		#add_child(popup)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y( - event.relative.x * x_sensibility)
		$Camera3D.rotate_x( - event.relative.y * y_sensibility)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir

	if global.awsd:
		input_dir = Input.get_vector("izq","der","palante","patras")
	else:
		input_dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
