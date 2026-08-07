extends "res://scripts/dialogue.gd"

@export var previousOptions : CanvasLayer
@export var newOptions : CanvasLayer

func _on_reject_help():
	previousOptions.hide()
	speak()

func _end_dialogue():
	if newOptions != null:
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		newOptions.show()
