extends "res://scripts/dialogue.gd"


func _tell_skippy() -> void:
	$"../TellSkippy/CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()

func end_dialogue():
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
	$WhatToDo/CanvasLayer.show()
	
