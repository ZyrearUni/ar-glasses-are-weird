extends "res://scripts/dialogue.gd"

const SITTING_HEIGHT = 3
var position_look

func _ready() -> void:
	position_look = $"../../Classroom/Teacher".global_position
	position_look.y += SITTING_HEIGHT

func _on_sit_down_area_body_entered(body: Node3D) -> void:
	if body == Player:
		await $"../../../fade".fade_to_black()
		speak()
		Player.set_global_position(self.global_position)
		Player.look_at_somewhere(position_look)

func end_dialogue():
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
	$"../DecisionMenu/CanvasLayer".show()
