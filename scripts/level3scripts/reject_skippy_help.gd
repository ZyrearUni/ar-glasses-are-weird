extends "res://scripts/dialogue.gd"

@export var previousOptions : CanvasLayer
@export var newOptions : CanvasLayer

func _on_reject_help():
	previousOptions.hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()

func end_dialogue():
	if (!Dialogues.is_empty()):
		Dialogues = []
		if newOptions != null:
			for speaker in Speakers:
				speaker.hide()
			CurrentDialogue = -1
			DialogueUI.get_node("ContinueButton").disabled = true
			newOptions.show()
		else:
			super()
