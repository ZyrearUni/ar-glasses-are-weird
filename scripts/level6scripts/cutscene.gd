extends "res://scripts/dialogue_area_activation.gd"

var dialogue_finished = false

func init_dialogue(body : Node3D):
	if body == Player:
		$CollisionShape3D.disabled = true
		Player.look_at_somewhere($"../RaquelKidnap/".global_position)
		await get_tree().create_timer(0.5).timeout
		$"../RaquelKidnap/AnimationPlayer".play("WalkAway")
		speak()

func end_dialogue():
	if(!dialogue_finished):
		dialogue_finished = true
		Dialogues = []
		Speakers = []
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		$TellSkippy/CanvasLayer.show()
		
