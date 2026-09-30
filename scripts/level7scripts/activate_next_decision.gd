extends "res://scripts/speaking_button.gd"


func end_dialogue():
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
	$"../../../Decision2/CanvasLayer".show()
