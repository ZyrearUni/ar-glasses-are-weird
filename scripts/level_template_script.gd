extends "res://scripts/dialogue.gd"

signal level_start

@onready var fade = $fade

@export var nextLevel : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Level started")
	super()
	fade_from_black()
	level_start.emit()

func speak():
	super()

func finish_level() -> void:
	await fade_to_black()
	get_tree().change_scene_to_file(nextLevel)

func fade_from_black():
	var tween : Tween = create_tween()
	tween.tween_property(fade, "modulate:a", 0.0, 0.5).from(1.0)
	await tween.finished

func fade_to_black():
	var tween : Tween = create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, 0.5).from(0.0)
	await tween.finished
