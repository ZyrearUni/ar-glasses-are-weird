extends "res://scripts/dialogue.gd"

func end_dialogue():
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
	$"HasBloodDecision/CanvasLayer".show()

func _on_decision_made():
	$"HasBloodDecision/CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
