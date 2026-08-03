extends "res://scripts/dialogue.gd"


func _on_reject_button_pressed() -> void:
	$"../../../DecisionMenu/CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()
	$"../../LevelFinishReject".monitoring = true
