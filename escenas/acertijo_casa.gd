extends CanvasLayer

var acertijos = [
	"Tengo ciudades, pero no casas. Tengo montañas, pero no árboles. Tengo agua, pero no peces. ¿Qué soy?",
	"Me puedes romper sin tocarme o verme. ¿Qué soy?",
	"Cuanto más quitas, más grande se hace. ¿Qué es?",
	"Si me nombras, desaparezco. ¿Qué soy?",
	"Tengo un cuello, pero no una cabeza, y llevo un sombrero. ¿Qué soy?"
]

var randNum

# Called when the node enters the scene tree for the first time.
func _ready():
	randNum = RandomNumberGenerator.new().randi_range(0, 4)
	$Label2.text = acertijos[randNum]
	$ColorRect.hide()
	$Label.hide()
	$Label2.hide()
	$Label3.hide()
	$VBoxContainer.hide()
	
	if randNum == 0:
		$"VBoxContainer/respuesta 1".text = "un mapa"
		$"VBoxContainer/respuesta 2".text = "clash of clans"
	elif randNum == 1:
		$"VBoxContainer/respuesta 1".text = "una promesa"
		$"VBoxContainer/respuesta 2".text = "un corazón"
	elif randNum == 2:
		$"VBoxContainer/respuesta 1".text = "una hipoteca"
		$"VBoxContainer/respuesta 2".text = "un agujero"
	elif randNum == 3:
		$"VBoxContainer/respuesta 1".text = "un eco"
		$"VBoxContainer/respuesta 2".text = "el silencio"
	elif randNum == 4:
		$"VBoxContainer/respuesta 1".text = "una botella"
		$"VBoxContainer/respuesta 2".text = "el hombre invisible"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_respuesta_1_pressed():
	if randNum == 0:
		global.pass_scene = 1
	elif randNum == 1:
		global.pass_scene = 1
	elif randNum == 2:
		global.pass_scene = -1
	elif randNum == 3:
		global.pass_scene = -1
	elif randNum == 4:
		global.pass_scene = 1


func _on_respuesta_2_pressed():
	if randNum == 0:
		global.pass_scene = -1
	elif randNum == 1:
		global.pass_scene = -1
	elif randNum == 2:
		global.pass_scene = 1
	elif randNum == 3:
		global.pass_scene = 1
	elif randNum == 4:
		global.pass_scene = -1
