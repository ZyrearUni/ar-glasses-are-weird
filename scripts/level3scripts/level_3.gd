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
		# Disable kid interactions
		# Enable Raquel Interaction
		# Player.unstuck()
		# speak()


# func end_dialogue():

func _on_kid_interacted() -> void:
	interactions += 1
	_max_interactions_reached()
