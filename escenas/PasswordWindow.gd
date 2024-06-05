extends Window

@export var password_input: LineEdit
@export var ok_button: Button

@export var correct_password: String = "my_secret_password"

# Called when the node enters the scene tree for the first time.
func _ready():
	ok_button.connect("pressed", Callable(self, "_on_ok_button_pressed"))

func _on_ok_button_pressed():
	if password_input.text == correct_password:
		print("Acceso concedido")
		hide()
	else:
		print("Contraseña incorrecta")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
