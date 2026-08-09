extends "res://scripts/level_template_script.gd"

func end_dialogue():
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	DialogueUI.get_node("ContinueButton").disabled = true
	$DecisionTree/SliderDecision.show()

func on_valor_elegido(valor) -> void:
	$DecisionTree/SliderDecision.hide()
	
	var nextDialogue
	
	if valor == 0:
		nextDialogue = $DecisionTree/SliderDecision/Range0
	elif valor in range(1, 3):
		nextDialogue = $"DecisionTree/SliderDecision/Range1-3"
	elif valor in range (4, 6):
		nextDialogue = $"DecisionTree/SliderDecision/Range4-6"
	elif valor in range(7, 9):
		nextDialogue = $"DecisionTree/SliderDecision/Range7-9" 
	else:
		nextDialogue = $DecisionTree/SliderDecision/Range10 
	
	nextDialogue.speak()


func _on_range_0_level_finish() -> void:
	insightContent = "Seguro que mi pierna está bien, ¿no?\n Skippy no puede haberse equivocado"
	save_game_data("Herida registrada con daño de escala 0\n")
	finish_level()


func _on_visit_teacher_ending_level_finish() -> void:
	pass # Replace with function body.
