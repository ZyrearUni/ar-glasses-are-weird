extends "res://scripts/dialogue.gd"

var enabled = false
signal level_finish

func speak():
	if enabled:
		super()
		

func end_dialogue():
	super()
	level_finish.emit()

func _on_walk_tutorial_area_walk_tutorial_finished() -> void:
	enabled = true 
