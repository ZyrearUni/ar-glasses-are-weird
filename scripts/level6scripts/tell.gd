extends "res://scripts/dialogue.gd"


func _tell_skippy() -> void:
	$"../TellSkippy/CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()

func end_dialogue():
	if (!Dialogues.is_empty()):
		Dialogues = []
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		$Relax/CanvasLayer.show()
	
