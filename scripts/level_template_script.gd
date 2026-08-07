extends "res://scripts/dialogue.gd"

signal level_start

@onready var fade = $fade
@onready var insight = $MoralInsight
@onready var insightContent : String = "No deberías estar leyendo esto. ¿Qué has hecho?"

@export var nextLevel : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	fade.fade_from_black()
	level_start.emit()

func speak():
	super()

func finish_level() -> void:
	await fade.fade_to_black()
	
	if insightContent != "" || !(insightContent.is_empty()):
		await give_moral_insight(insightContent)
		
	get_tree().change_scene_to_file(nextLevel)

func give_moral_insight(content: String):
	
	fade.hide()
	await insight.give_moral_insight(content)
	fade.show()

func save_game_data(content):
	var file = FileAccess.open("res://saveFile.txt", FileAccess.READ_WRITE)
	file.store_string(content)

func load_game_data():
	var file = FileAccess.open("res://saveFile.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content
