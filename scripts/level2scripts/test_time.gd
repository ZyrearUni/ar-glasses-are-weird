extends "res://scripts/dialogue.gd"

var accepted_help = false
var hints = []
var questions = []
var answers = []

func _ready() -> void:
	$AnswerInput.hide()
	$SkippyAid.hide()

func help_accepted():
	accepted_help = true
	# hints = [] 

func start_test():
	pass
