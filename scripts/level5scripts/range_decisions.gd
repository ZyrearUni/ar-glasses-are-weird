extends "res://scripts/dialogue.gd"

@export var Canvas : CanvasLayer

func end_dialogue():
	if (!Dialogues.is_empty()):
		Dialogues = []
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		Canvas.show()
