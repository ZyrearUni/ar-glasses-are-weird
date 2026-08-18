extends "res://scripts/dialogue_area_activation.gd"


func init_dialogue(body : Node3D):
	if body == Player:
		Player.look_at(Vector3(-130, 0, 10))
		await get_tree().create_timer(0.5).timeout
		$"../RaquelKidnap/AnimationPlayer".play("WalkAway")
		super(body)

func end_dialogue():
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
	$TellSkippy/CanvasLayer.show()
	
