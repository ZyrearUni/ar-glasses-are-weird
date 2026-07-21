extends "res://scripts/dialogue_area_activation.gd"

signal activate_next_area

func end_dialogue():
	super()
	activate_next_area.emit()
