extends "res://scripts/dialogue.gd"

signal ending

func _on_pressed() -> void:
	$"..".hide()
	speak()
	
func end_dialogue():
	super()
	ending.emit()
