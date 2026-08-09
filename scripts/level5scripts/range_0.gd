extends "res://scripts/dialogue.gd"

signal level_finish

func speak():
	DialogueUI.get_node("ContinueButton").disabled = false
	super()

func end_dialogue():
	super()
	level_finish.emit()
