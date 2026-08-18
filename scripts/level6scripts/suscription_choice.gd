extends "res://scripts/dialogue.gd"


func _on_option_selected() -> void:
	$"../Suscription/CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()
