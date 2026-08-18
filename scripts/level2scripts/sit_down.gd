extends "res://scripts/dialogue.gd"

const SITTING_HEIGHT = 1.42

func _on_sit_down_area_body_entered(body: Node3D) -> void:
	if body == Player:
		await $"../../../fade".fade_to_black()
		speak()
		Player.head.position.y = SITTING_HEIGHT
		Player.set_global_position(self.global_position)
		Player.look_at(Vector3(20, 0, 500))
		await $"../../../fade".fade_from_black()

func end_dialogue():
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
	$"../DecisionMenu/CanvasLayer".show()
