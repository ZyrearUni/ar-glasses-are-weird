extends "res://scripts/dialogue.gd"

var interactable = false

func speak():
	if interactable:
		super()
		

func _on_next_scene():
	interactable = true
