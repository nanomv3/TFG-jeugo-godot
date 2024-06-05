extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var x_sensibility = 0.0005
var y_sensibility = 0.001

@export var house: StaticBody3D
@export var password_window: Window

@export var interact_distance: float = 5.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		print(x_sensibility)
		rotate_y( - event.relative.x * x_sensibility)
		$Camera3D.rotate_x( - event.relative.y * y_sensibility)
		
		if event.pressed and event.scancode == KEY_E:
			if is_near_house():
				password_window.popup_centered()
				

func is_near_house() -> bool:
	return global_transform.origin.distance_to(house.global_transform.origin) < interact_distance

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
