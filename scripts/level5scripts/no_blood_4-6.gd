extends "res://scripts/dialogue.gd"



func _on_pressed() -> void:
	speak()

func end_dialogue():
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
	$"../../../../Range1-3/HasBruiseDecision/CanvasLayer".show()
