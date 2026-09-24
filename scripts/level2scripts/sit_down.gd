extends "res://scripts/dialogue.gd"

const SITTING_HEIGHT = 3
var teacher_pos 

func _on_sit_down_area_body_entered(body: Node3D) -> void:
	if body == Player:
		$".".hide()
		# Si se pone teacher_pos en una función _ready no se puede avanzar el diálogo.
		# Se ajusta la altura para ver mejor
		teacher_pos = $"../../Classroom/Teacher".global_position
		teacher_pos.y += SITTING_HEIGHT
		
		await $"../../../fade".fade_to_black()
		$"../../Classroom/Kids".hide()
		speak()
		Player.set_global_position(self.global_position)
		Player.look_at_somewhere(teacher_pos)
		await $"../../../fade".fade_from_black()

func end_dialogue():
	if(Dialogues.size() != 0): 
		$"../DecisionMenu/CanvasLayer".show()
		$".".disabled = true
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		Dialogues = []
		
