extends "res://scripts/level_template_script.gd"

@onready var cutscene = $stage/city/CutsceneArea
var selectedOption

var ap1_text = $"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos positivos/AP1".aspecto
var an1_text = $"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos negativos/AN1".aspecto
var an3_text = $"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos negativos/AN3".aspecto

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
		$"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos negativos/AN3".queue_free()
	
	elif data.contains(CANCEL_CALL):
		cutscene.set_option(CANCELAR_LLAMADA)
		selectedOption = CANCELAR_LLAMADA
	
	else:
		cutscene.set_option(CONTACTAR_AUTORIDAD)
		selectedOption = CONTACTAR_AUTORIDAD
		$"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos negativos/AN3".queue_free()


func finish_level() -> void:
	if (selectedOption == CONTACTAR_AUTORIDAD):
		await $stage/city/CutsceneArea/Option2/Shutdown.play()
	
	super()


func _on_ap_1x_pressed() -> void:
	failed_identify_aspect(ap1_text)


func _on_ap_1v_pressed() -> void:
	identify_aspect(ap1_text)


func _on_an_3x_pressed() -> void:
	failed_identify_aspect(an3_text)


func _on_an_3v_pressed() -> void:
	identify_aspect(an3_text)


func _on_an_1x_pressed() -> void:
	failed_identify_aspect(an1_text)


func _on_an_1v_pressed() -> void:
	identify_aspect(an1_text)
