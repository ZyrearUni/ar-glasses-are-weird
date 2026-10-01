extends "res://scripts/speaking_button.gd"


func end_dialogue():
	$"../../../SkippyArgument/CanvasLayer".show()
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
