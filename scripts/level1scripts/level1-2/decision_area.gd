extends "res://scripts/dialogue_area_activation.gd"


func end_dialogue():
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
	$"../../DecisionMenu/CanvasLayer".show()
	
