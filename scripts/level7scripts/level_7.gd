extends "res://scripts/level_template_script.gd"

@onready var cutscene = $stage/city/CutsceneArea
var selectedOption

enum {
	NO_CONTAR = 0,
	CANCELAR_LLAMADA = 1,
	CONTACTAR_AUTORIDAD = 2
}

func _ready() -> void:
	super()
	scenario_distinction("Escenario 7:")

func on_option_end():
	# TODO Modificar la moraleja al final del escenario
	match selectedOption:
		NO_CONTAR || CANCELAR_LLAMADA:
			save_game_data(SKIPPY_ON)
		_:
			save_game_data(SKIPPY_OFF)
	finish_level()


func _on_cutscene_area_body_entered(body: Node3D) -> void:
	var data = load_game_data()
	if data.contains(SKIPPY_UNKNOWING):
		cutscene.set_option(NO_CONTAR)
		selectedOption = NO_CONTAR
	elif data.contains(CANCEL_CALL):
		cutscene.set_option(CANCELAR_LLAMADA)
		selectedOption = CANCELAR_LLAMADA
	else:
		cutscene.set_option(CONTACTAR_AUTORIDAD)
		selectedOption = CONTACTAR_AUTORIDAD
