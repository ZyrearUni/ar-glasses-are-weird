extends "res://scripts/dialogue.gd"


func speak():
	await $"../../../fade".fade_to_black()
	super()

func end_dialogue():
	await get_tree().create_timer(1).timeout
	super()
