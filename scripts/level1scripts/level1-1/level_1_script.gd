extends "res://scripts/level_template_script.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	scenario_distinction("Escenario 1:") 
	super.speak()

func _on_mom_level_finish() -> void:
	super.finish_level()
