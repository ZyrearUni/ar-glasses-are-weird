extends "res://scripts/dialogue.gd"

signal level_finish

func end_dialogue():
	super()
	level_finish.emit()
	
