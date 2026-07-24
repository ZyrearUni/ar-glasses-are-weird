extends "res://scripts/dialogue.gd"

signal level_start

@onready var fade = $fade

@export var nextLevel : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Level started")
	super()
	fade.fade_from_black()
	level_start.emit()

func speak():
	super()

func finish_level() -> void:
	await fade.fade_to_black()
	get_tree().change_scene_to_file(nextLevel)
