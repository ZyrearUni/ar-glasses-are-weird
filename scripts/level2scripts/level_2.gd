extends "res://scripts/level_template_script.gd"

var result

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	result = load_game_data()
	enable_correct_dialogue_tree()

func enable_correct_dialogue_tree():
	if result.contains(REJECT_GAME):
		$stage/StartingDialogueTreeOptions/RejectedGame.speak()
	else:
		$stage/StartingDialogueTreeOptions/AcceptedGame.speak()

# No se puede sobreescribir finish_level por necesitar el valor value
func finish_level_override(value):
	save_game_data(QUESTIONS_ANSWERED_CORRECTLY + value + "preguntas\n")
	# TODO moraleja, reacciones de Skippy
	finish_level()
