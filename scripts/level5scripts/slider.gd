extends Control

signal valor_elegido

func _on_elegir_valor_pressed() -> void:
	valor_elegido.emit($HSlider.value)
