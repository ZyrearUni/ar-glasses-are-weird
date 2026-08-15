extends "res://scripts/level_template_script.gd"

@onready var cutscene = $stage/City/CutsceneArea
var selectedOption

enum {
	NO_CONTAR = 0,
	CANCELAR_LLAMADA = 1,
	CONTACTAR_AUTORIDAD = 2
}

func _ready() -> void:
	super()
	var data = load_game_data()
	if data.contains("No le cuentas a Skippy sobre Raquel"):
		cutscene.set_option(NO_CONTAR)
		selectedOption = NO_CONTAR
	elif data.contains("Cancelas la llamada a la policía"):
		cutscene.set_option(CANCELAR_LLAMADA)
		selectedOption = CANCELAR_LLAMADA
	else:
		cutscene.set_option(CONTACTAR_AUTORIDAD)
		selectedOption = CONTACTAR_AUTORIDAD


func on_option_end():
	# TODO Modificar la moraleja al final del escenario
	match selectedOption:
		NO_CONTAR:
			print("No contó una mierda")
		CANCELAR_LLAMADA:
			print("Canceló la llamada el invesil")
		_:
			print("No sé, todo lo demás")
	
	finish_level()
