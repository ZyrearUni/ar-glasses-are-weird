extends "res://scripts/level_template_script.gd"

const MAX_INTERACTIONS = 3
@onready var interactions = 0


signal next_scene

func _start():
	fade.fade_from_black()
	level_start.emit()

func _max_interactions_reached():
	if interactions == MAX_INTERACTIONS:
		print("Interacciones máximas alcanzadas")


func _on_kid_interacted() -> void:
	interactions = interactions + 1
	_max_interactions_reached()
