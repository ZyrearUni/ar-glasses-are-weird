extends "res://scripts/dialogue.gd"

signal help_accepted

func _on_option_selected() -> void:
	$"../CanvasLayer".hide()
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()
	if self != $"../RejectOffer":
		help_accepted.emit()
		

func end_dialogue():
	Dialogues = []
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	selectedTalking = false
	dialogue_ended.emit()
