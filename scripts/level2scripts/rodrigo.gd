extends "res://scripts/dialogue.gd"

var changed_dialogue = false

func change_dialogue():
	Dialogues = [
		"Melisa se ha reído de mi nota en los problemas...",
		"¡No es justo! Solo lo hace mejor por esas tontas gafas que tiene.",
		"Si tuviera yo unas..."
	]
	
	SpeakerAnimations = ["Triste", "Triste", "Triste"]
	
	changed_dialogue = true

func end_dialogue():
	if (changed_dialogue):
		if(Dialogues.size() != 0): 
			$"../../../RodrigoIssue/DecisionMenu/CanvasLayer".show()
			for speaker in Speakers:
				speaker.hide()
			CurrentDialogue = -1
			DialogueUI.get_node("ContinueButton").disabled = true
			Dialogues = []
	else:
		super()
