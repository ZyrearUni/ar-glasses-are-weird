extends "res://scripts/dialogue.gd"

@onready var optionsMenus : Array[CanvasLayer] = [$"../FirstDecision/CanvasLayer", $"../SecondDecision/CanvasLayer", $"../ThirdDecision/CanvasLayer"]

func _on_accept_help():
	for options in optionsMenus:
		options.hide()
	DialogueUI.get_node("ContinueButton").disabled = true
	speak()
