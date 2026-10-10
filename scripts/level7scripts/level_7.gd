extends "res://scripts/level_template_script.gd"

@onready var cutscene = $stage/city/CutsceneArea
var selectedOption

@onready var AP1 = $"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos positivos/AP1"
@onready var AN1 = $"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos negativos/AN1"
@onready var AN3 = $"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos negativos/AN3"


enum {
	NO_CONTAR = 0,
	CANCELAR_LLAMADA = 1,
	CONTACTAR_AUTORIDAD = 2
}

func _ready() -> void:
	super()
	scenario_distinction("Escenario 7:")

func _on_cutscene_area_body_entered(body: Node3D) -> void:
	var data = load_game_data()
	if data.contains(SKIPPY_UNKNOWING):
		cutscene.set_option(NO_CONTAR)
		selectedOption = NO_CONTAR
		AN3.hide()
		save_game_data(SKIPPY_ON)
	
	elif data.contains(CANCEL_CALL):
		cutscene.set_option(CANCELAR_LLAMADA)
		selectedOption = CANCELAR_LLAMADA
		save_game_data(SKIPPY_ON)
	
	else:
		cutscene.set_option(CONTACTAR_AUTORIDAD)
		selectedOption = CONTACTAR_AUTORIDAD
		AN3.hide()
		save_game_data(SKIPPY_OFF)


func finish_level() -> void:
	if (selectedOption == CONTACTAR_AUTORIDAD):
		$stage/city/CutsceneArea/Option2/Shutdown.play()
		await $stage/city/CutsceneArea/Option2/Shutdown.finished
	
	super()


func _on_ap_1x_pressed() -> void:
	failed_identify_aspect(AP1.aspecto)


func _on_ap_1v_pressed() -> void:
	identify_aspect(AP1.aspecto)


func _on_an_3x_pressed() -> void:
	failed_identify_aspect(AN3.aspecto)
	add_explanation(AN3.explanation)


func _on_an_3v_pressed() -> void:
	identify_aspect(AN3.aspecto)


func _on_an_1x_pressed() -> void:
	failed_identify_aspect(AN1.aspecto)
	add_explanation(AN1.explanation)


func _on_an_1v_pressed() -> void:
	identify_aspect(AN1.aspecto)
