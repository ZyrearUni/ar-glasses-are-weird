extends "res://scripts/dialogue.gd"


func end_dialogue():
	if !(Dialogues.is_empty()):
		Dialogues = []
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		$Decision/CanvasLayer.show()
