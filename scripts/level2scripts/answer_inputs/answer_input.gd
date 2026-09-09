extends Control

signal answer_confirmed

func _on_button_pressed() -> void:
	var value = $Numerator.value / $Denominator.value
	answer_confirmed.emit(value)
