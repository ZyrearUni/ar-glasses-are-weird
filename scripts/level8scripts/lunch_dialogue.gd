extends "res://scripts/dialogue.gd"


func speak():
	Player.global_position = $"../LunchDialogue".global_position
	Player.look_at_somewhere($"../Mom2".global_position)
	$"../Mom".hide()
	$"../Mom2".show()
	CurrentDialogue = -1
	super()

func end_dialogue():
	await $"../../../fade".fade_to_black()
	super()
