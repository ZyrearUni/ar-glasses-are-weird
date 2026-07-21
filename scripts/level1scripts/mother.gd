extends "res://scripts/dialogue.gd"

var enabled = false

func speak():
	if enabled:
		super()
		

func end_dialogue():
	super()
	emit_signal("level_finish")

func _on_walk_tutorial_area_walk_tutorial_finished() -> void:
	enabled = true 
