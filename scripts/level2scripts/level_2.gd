extends "res://scripts/level_template_script.gd"

var result

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	result = load_game_data()
	enable_correct_dialogue_tree()

func enable_correct_dialogue_tree():
	if result == REJECT_GAME:
		print("Rechazó el parkour to guapo")
		$stage/StartingDialogueTreeOptions/RejectedGame.speak()
	else:
		print("Se cree Mario el pibe")
		$stage/StartingDialogueTreeOptions/AcceptedGame.speak()
