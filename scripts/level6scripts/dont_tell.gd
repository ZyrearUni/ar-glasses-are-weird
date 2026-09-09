extends "res://scripts/dialogue.gd"


func _dont_tell_skippy() -> void:
	$"../TellSkippy/CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()
