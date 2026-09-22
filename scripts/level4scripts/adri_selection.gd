extends "res://scripts/dialogue.gd"


func _on_pressed() -> void:
	$"..".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()
