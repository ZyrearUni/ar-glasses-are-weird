extends "res://scripts/dialogue.gd"


func _on_tell_teacher() -> void:
	$"../WhatToDo/CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()

func end_dialogue():
	Dialogues = []
	Speakers = []
	await $"../../../../../fade".fade_to_black()
	super()
