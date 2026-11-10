extends "res://scripts/speaking_button.gd"

@onready var fade = $"../../../../../../fade"

func end_dialogue():
	await fade.fade_to_black()
	super()
	$"../../../../LunchDialogue".speak()
	await fade.fade_from_black()
