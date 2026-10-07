extends "res://scripts/dialogue.gd"

@onready var fade = $"../../fade"

func next_scene():
	await fade.fade_to_black()
	Player.unstuck()
	await fade.fade_from_black()
	speak()

func end_dialogue():
	if (!Dialogues.is_empty()):
		Dialogues = []
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		$FirstDecision/CanvasLayer.show()
