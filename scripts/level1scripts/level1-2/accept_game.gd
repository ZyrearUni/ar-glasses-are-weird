extends "res://scripts/dialogue.gd"


func _on_accept_button_pressed() -> void:
	$"../../City/ParkourBlockage/CollisionShape3D".disabled = true
	$"../../../DecisionMenu/CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()
