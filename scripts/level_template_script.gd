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

func save_game_data(content):
	var file = FileAccess.open("res://saveFile.txt", FileAccess.WRITE)
	file.store_csv_line(content, "\n")

func load_game_data():
	var file = FileAccess.open("res://saveFile.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content
