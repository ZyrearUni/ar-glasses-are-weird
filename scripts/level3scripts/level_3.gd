extends "res://scripts/level_template_script.gd"

const MAX_INTERACTIONS = 2
@onready var interactions = 0


signal next_scene

func _ready():
	super()
	scenario_distinction("Escenario 3:")
	$stage/Schoolyard/Rodrigo.get_node("Sprite3D").texture = load("res://assets/sprites/Kids/rodribasket.png")


func _max_interactions_reached():
	if interactions == MAX_INTERACTIONS:
		print("Interacciones máximas alcanzadas")
		next_scene.emit()


func _on_kid_interacted() -> void:
	interactions += 1
	_max_interactions_reached()

func _raquel_is_friend():
	save_game_data(RAQUEL_FRIEND)


func _raquel_awkward():
	save_game_data(RAQUEL_AWKWARD)


func _an1_not_identified() -> void:
	failed_identify_aspect("Diseño que conlleva una pérdida de valores")


func _an1_identified() -> void:
	identify_aspect("Diseño que conlleva una pérdida de valores")
	

func _an2_not_identified() -> void:
	failed_identify_aspect("Manipulación")


func _an2_identified() -> void:
	identify_aspect("Manipulación")
