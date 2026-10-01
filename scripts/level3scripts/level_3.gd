extends "res://scripts/level_template_script.gd"

const MAX_INTERACTIONS = 2
@onready var interactions = 0


signal next_scene

func _start():
	fade.fade_from_black()
	level_start.emit()
	scenario_distinction("Escenario 3:")


func _max_interactions_reached():
	if interactions == MAX_INTERACTIONS:
		print("Interacciones máximas alcanzadas")
		next_scene.emit()


func _on_kid_interacted() -> void:
	interactions += 1
	_max_interactions_reached()


func _an1v_not_identified() -> void:
	failed_identify_aspect("Diseño que conlleva una pérdida de valores")


func _an1v_identified() -> void:
	identify_aspect("Diseño que conlleva una pérdida de valores")
	

func _an2v_not_identified() -> void:
	failed_identify_aspect("Manipulación")


func _an2v_identified() -> void:
	identify_aspect("Manipulación")
