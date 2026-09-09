extends Control

signal answer_confirmed

func _on_button_pressed() -> void:
	answer_confirmed.emit($TextEdit.text)
