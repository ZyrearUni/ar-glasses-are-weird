extends "res://scripts/dialogue.gd"


func _on_tell_teacher() -> void:
	$"../WhatToDo/CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()
