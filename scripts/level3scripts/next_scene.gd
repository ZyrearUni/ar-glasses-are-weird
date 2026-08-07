extends "res://scripts/dialogue.gd"

@onready var fade = $"../../fade"

func _on_next_scene():
	await fade.fade_to_black()
	Player.unstuck()
	await fade.fade_from_black()
	speak()

func _end_dialogue():
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
	$FirstDecision/CanvasLayer.show()
