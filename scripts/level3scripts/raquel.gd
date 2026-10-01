extends "res://scripts/dialogue.gd"

var interactable = false

func speak():
	if interactable:
		super()
		

func end_dialogue():
	$SkippyFriendTip/CanvasLayer.show()
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true

func _on_next_scene():
	interactable = true
	$"../Schoolyard/Raquel".set_collision_layer(2)
	$"../Schoolyard/Raquel".set_collision_mask(2)
