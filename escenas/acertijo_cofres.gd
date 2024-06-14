extends CanvasLayer

var acertijos = [
	"Blanca por dentro, verde por fuera. Si quieres que te lo diga, espera. ¿Qué es?",
	"Tengo agujas y no sé coser. ¿Qué soy?",
	"Paso por el agua y no me mojo. ¿Qué soy?",
	"Vuelo sin alas y lloro sin ojos. ¿Qué soy?",
	"Tiene dientes pero no muerde. ¿Qué es?",
	"No se puede ver, pero se puede oír. No se puede tocar, pero se puede sentir. ¿Qué es?",
	"Un hombre sale de casa, da tres vueltas a la manzana y vuelve a casa, ¿qué ha ocurrido?",
	"Si me tienes, quieres compartirlo. Si lo compartes, ya no lo tienes. ¿Qué soy?",
	"Tengo orejas largas, y siempre estoy saltando. ¿Qué soy?",
	"Vuelo de noche, duermo de día y nunca verás plumas en ala mía. ¿Qué soy?"
]

var randNum

# Called when the node enters the scene tree for the first time.
func _ready():
	randNum = RandomNumberGenerator.new().randi_range(0, 9)
	$Label2.text = acertijos[randNum]
	$ColorRect.hide()
	$Label.hide()
	$Label2.hide()
	$Label3.hide()
	$VBoxContainer.hide()
	
	if randNum == 0:
		$"VBoxContainer/respuesta 1".text = "el aguacate"
		$"VBoxContainer/respuesta 2".text = "platano verde"
	elif randNum == 1:
		$"VBoxContainer/respuesta 1".text = "un erizo"
		$"VBoxContainer/respuesta 2".text = "un reloj"
	elif randNum == 2:
		$"VBoxContainer/respuesta 1".text = "jesucristo"
		$"VBoxContainer/respuesta 2".text = "una sombra"
	elif randNum == 3:
		$"VBoxContainer/respuesta 1".text = "un pensamiento"
		$"VBoxContainer/respuesta 2".text = "una nube"
	elif randNum == 4:
		$"VBoxContainer/respuesta 1".text = "el peine"
		$"VBoxContainer/respuesta 2".text = "una dentadura"
	elif randNum == 5:
		$"VBoxContainer/respuesta 1".text = "el viento"
		$"VBoxContainer/respuesta 2".text = "el corazón"
	elif randNum == 6:
		$"VBoxContainer/respuesta 1".text = "juega béisbol"
		$"VBoxContainer/respuesta 2".text = "salio a correr"
	elif randNum == 7:
		$"VBoxContainer/respuesta 1".text = "un regalo"
		$"VBoxContainer/respuesta 2".text = "un secreto"
	elif randNum == 8:
		$"VBoxContainer/respuesta 1".text = "un atleta"
		$"VBoxContainer/respuesta 2".text = "un conejo"
	elif randNum == 9:
		$"VBoxContainer/respuesta 1".text = "un avión"
		$"VBoxContainer/respuesta 2".text = "un murciélago"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_respuesta_1_pressed():
	if randNum == 0:
		global.pass_scene = -1
	elif randNum == 1:
		global.pass_scene = 1
	elif randNum == 1:
		global.pass_scene = -1
	elif randNum == 2:
		global.pass_scene = -1
	elif randNum == 3:
		global.pass_scene = -1
	elif randNum == 4:
		global.pass_scene = 1
	elif randNum == 5:
		global.pass_scene = 1
	elif randNum == 6:
		global.pass_scene = 1
	elif randNum == 7:
		global.pass_scene = -1
	elif randNum == 8:
		global.pass_scene = -1
	elif randNum == 9:
		global.pass_scene = -1


func _on_respuesta_2_pressed():
	if randNum == 0:
		global.pass_scene = -1
	elif randNum == 1:
		global.pass_scene = 1
	elif randNum == 2:
		global.pass_scene = 1
	elif randNum == 3:
		global.pass_scene = 1
	elif randNum == 4:
		global.pass_scene = -1
	elif randNum == 5:
		global.pass_scene = -1
	elif randNum == 6:
		global.pass_scene = -1
	elif randNum == 7:
		global.pass_scene = 1
	elif randNum == 8:
		global.pass_scene = 1
	elif randNum == 9:
		global.pass_scene = 1
