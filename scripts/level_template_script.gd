extends "res://scripts/dialogue.gd"

signal level_start

const SAVE_FILE = "user://saveFile.txt"

# Lista de valores posibles en el archivo de guardado

# Nivel 1
const ACCEPT_GAME = "Llega tarde\n"
const REJECT_GAME = "Llega bien\n"

# Nivel 2
const ACCEPT_HELP_CLASS = "Acepta la ayuda de Skippy en clase\n"
const REJECT_HELP_CLASS = "Rechaza la ayuda de Skippy en clase\n"
const QUESTIONS_ANSWERED_CORRECTLY = "El jugador ha respondido correctamente: "

# Nivel 3
const RAQUEL_AWKWARD = "Raquel se extraña de tu actitud\n"
# TODO otros finales

# Nivel 5 (el nivel 4 no se guarda en el archivo)
const NO_WOUND = "No se registra ninguna herida\n"
const REGISTERED_WOUND = "Herida registrada con nivel de daño: "
const AMBULANCE = "Skippy llama a emergencias por la herida registrada.\n"

# Nivel 6
const SKIPPY_UNKNOWING = "No le cuentas a Skippy tus preocupaciones sobre Raquel\n"
const CANCEL_CALL = "Cancelas la llamada a la policía\n"
const CALL_POLICE = "Llamas a la policía con Skippy\n"
const TELL_TEACHER = "Le cuentas a la profesora sobre la situación de Raquel\n"

# Nivel 7
const SKIPPY_OFF = "Skippy se apaga\n"
const SKIPPY_ON = "Skippy se mantiene encendido\n"

# Nivel 8


@onready var fade = $fade
@onready var insight = $MoralInsight
@onready var insightContent : String = "No deberías estar leyendo esto. ¿Qué has hecho?"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	get_tree().current_scene.get_node("DialogueUI/Canvas").hide()
	fade.fade_from_black()
	level_start.emit()

func speak():
	super()

func finish_level() -> void:
	await fade.fade_to_black()
	$AudioStreamPlayer.fade_out()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	$Study/CanvasLayer.show()


func give_moral_insight(content: String):
	
	fade.hide()
	await insight.give_moral_insight(content)
	fade.show()

# Guardar en saveFile.txt
func save_game_data(content):
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ_WRITE)
	file.seek_end()
	file.store_string(content)

# Cargar saveFile.txt (para consecuencias en juego)
func load_game_data():
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	var content = file.get_as_text()
	return content

# Acabar el juego
func end_game():
	# Cambiar a escena de créditos
	pass
