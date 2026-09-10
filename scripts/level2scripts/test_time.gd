extends "res://scripts/dialogue.gd"

var accepted_help = false
var hints = []
var questions = []
var answers = []
var currentQuestion = 0
var correctAnswerCount = 0

func _ready() -> void:
	$AnswerInput.hide()
	$SkippyAid.hide()

func help_accepted():
	accepted_help = true
	# hints = [] 

func start_test():
	Dialogues = [questions[currentQuestion]]
	if (accepted_help):
		# hints[currentQuestion].show()
		print("Ahora se mostraría la ayuda de Skippy")
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()

func end_dialogue():
	if (currentQuestion >= questions.size()-1):
		super()
		$"../../../..".finish_level_override(correctAnswerCount)
	else:
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		$AnswerInput.show()

func received_answer(value):
	if (value == answers[currentQuestion]):
		correctAnswerCount += 1
	
	currentQuestion += 1
	start_test()
