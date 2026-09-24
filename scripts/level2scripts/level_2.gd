extends "res://scripts/level_template_script.gd"

var result
var accept_help = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SchoolBell.play()
	super()
	scenario_distinction("Escenario 2:")
	result = load_game_data()
	enable_correct_dialogue_tree()

func enable_correct_dialogue_tree():
	if result.contains(REJECT_GAME):
		$stage/StartingDialogueTreeOptions/RejectedGame.speak()
	else:
		$stage/StartingDialogueTreeOptions/AcceptedGame.speak()


func help_accepted():
	accept_help = true


# No se puede sobreescribir finish_level por necesitar el valor value
func finish_level_override(value):
	save_game_data(QUESTIONS_ANSWERED_CORRECTLY + value + "preguntas\n")
	if (accept_help):
		$"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos negativos/Aspecto3".show()
		speak()
	else:
		finish_level()


func end_dialogue():
	super()
	finish_level()


func finish_level() -> void:
	super()
	$SchoolBell.play()
