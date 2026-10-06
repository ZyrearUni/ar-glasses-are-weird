extends "res://scripts/speaking_button.gd"

@export var Canvas : Node

func end_dialogue():
	if (!Dialogues.is_empty()):
		Dialogues = []
		$".".hide()
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		Canvas.show()
	
