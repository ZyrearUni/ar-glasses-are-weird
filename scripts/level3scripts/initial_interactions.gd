extends "res://scripts/dialogue.gd"

signal kid_interacted

func speak():
	super()
	kid_interacted.emit()
