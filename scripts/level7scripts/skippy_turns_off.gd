extends "res://scripts/dialogue.gd"


func end_dialogue():
	await $Shutdown.play()
	super()
