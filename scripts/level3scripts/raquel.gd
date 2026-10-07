extends "res://scripts/dialogue.gd"

var interactable = false
@onready var Raquel = $"."

func speak():
	if interactable:
		super()
		

func end_dialogue():
	if(!Dialogues.is_empty()):
		Dialogues = []
		$SkippyFriendTip/CanvasLayer.show()
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true

func _on_next_scene():
	interactable = true
	Raquel.set_collision_layer(2)
	Raquel.set_collision_mask(2)
