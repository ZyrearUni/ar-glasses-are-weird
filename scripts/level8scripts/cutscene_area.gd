extends "res://scripts/dialogue_area_activation.gd"

var allowed_decision = false

func allow_decision():
	allowed_decision = true


func init_dialogue(body : Node3D):
	if(body == Player):
		Player.look_at_somewhere($"../Mom".global_position)
		$".".monitoring = false
		speak()

func end_dialogue():
	if(!Dialogues.is_empty()):
		Dialogues = []
		if(allowed_decision):
			$Decision.show()
			for speaker in Speakers:
				speaker.hide()
			CurrentDialogue = -1
			DialogueUI.get_node("ContinueButton").disabled = true
		else:
			await $"../../../fade".fade_to_black()
			super()
			$"../LunchDialogue".speak()
			await $"../../../fade".fade_from_black()
