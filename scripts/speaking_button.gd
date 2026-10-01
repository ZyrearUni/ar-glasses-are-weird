extends "res://scripts/dialogue.gd"

signal ending

func _on_pressed() -> void:
	$"..".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()
	
func end_dialogue():
	super()
	ending.emit()
