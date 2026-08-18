extends "res://scripts/dialogue.gd"

signal help_accepted

func _on_option_selected() -> void:
	$"../CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()
	if self != $"../RejectOffer":
		help_accepted.emit()
		
