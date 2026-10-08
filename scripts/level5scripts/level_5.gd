extends "res://scripts/level_template_script.gd"

func _ready() -> void:
	super()
	scenario_distinction("Escenario 5:")
	speak()

func end_dialogue():
	if(Dialogues.size() != 0): 
		Dialogues = []
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		$DecisionTree/CouldHaveAsked/CanvasLayer.show()


func on_valor_elegido(valor) -> void:
	$DecisionTree/SliderDecision.hide()
	
	var nextDialogue
	
	if (valor == 0.0):
		nextDialogue = $DecisionTree/SliderDecision/Range0
	elif (valor >= 1 && valor <= 3):
		nextDialogue = $"DecisionTree/SliderDecision/Range1-3"
	elif (valor >= 4 && valor <= 6):
		nextDialogue = $"DecisionTree/SliderDecision/Range4-6"
	elif (valor >= 7 && valor <= 9):
		nextDialogue = $"DecisionTree/SliderDecision/Range7-9" 
	else:
		nextDialogue = $DecisionTree/SliderDecision/Range10 
	
	DialogueUI.get_node("ContinueButton").disabled = false
	nextDialogue.speak()


func _on_range_0_level_finish() -> void:
	save_game_data(NO_WOUND)
	finish_level()


func _an2_identified() -> void:
	identify_aspect("Falta de Consentimiento")


func _an2_not_identified():
	failed_identify_aspect("Falta de Consentimiento")


func _an3_identified():
	identify_aspect("Diseño adictivo")


func _an3_not_identified():
	failed_identify_aspect("Diseño adictivo")


func _an4_identified():
	identify_aspect("Sobreconfianza en la IA")


func _an4_not_identified():
	failed_identify_aspect("Sobreconfianza en la IA")
