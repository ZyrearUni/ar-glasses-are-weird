extends "res://scripts/dialogue.gd"

signal ending

func speak():
	super()
	ending.emit()
