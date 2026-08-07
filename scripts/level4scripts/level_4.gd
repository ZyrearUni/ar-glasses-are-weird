extends "res://scripts/level_template_script.gd"


func end_dialogue():
	fade.fade_to_black()
	super()
	await fade.fade_from_black()
