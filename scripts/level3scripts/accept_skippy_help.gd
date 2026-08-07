extends "res://scripts/dialogue.gd"

@onready var optionsMenus : Array[CanvasLayer] = [$"../FirstDecision/CanvasLayer", $"../SecondDecision/CanvasLayer", $"../ThirdDecision/CanvasLayer"]

func _on_accept_help():
	for options in optionsMenus:
		options.hide()
	speak()
