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

func save_test_results(value):
	print(value)
	save_game_data(QUESTIONS_ANSWERED_CORRECTLY + str(value) + "preguntas\n")
	if(accept_help):
		speak()


func finish_level() -> void:
	super()
	$DialogueUI/Canvas.hide()
	$SchoolBell.play()


func _on_encourage_button_pressed() -> void:
	identify_aspect("Desigualdad por uso")


func _on_discourage_button_pressed() -> void:
	failed_identify_aspect("Desigualdad por uso")
