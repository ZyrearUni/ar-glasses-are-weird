extends "res://scripts/level_template_script.gd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super() 
	super.speak()

func _on_mom_level_finish() -> void:
	insightContent = ""
	super.finish_level()
