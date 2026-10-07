extends "res://scripts/dialogue.gd"

signal kid_interacted

func end_dialogue():
	super()
	kid_interacted.emit()
