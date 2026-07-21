extends "res://scripts/dialogue.gd"

signal level_start
signal level_finish
@onready var transitionPlayer = $TransitionScreen
@export var nextLevel : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transitionPlayer.fade_from_black()
	level_start.emit()
	

func speak():
	super()


func _on_level_finish() -> void:
	transitionPlayer.fade_to_black()
	get_tree().change_scene_to_file(nextLevel)
