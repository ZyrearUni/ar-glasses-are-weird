extends "res://scripts/dialogue.gd"

@onready var AnswerInput = $"../../../../AnswerInput"

var accepted_help = false
var hints = []
var questions = [
	"María se ha gastado 1/3 del dinero que le dieron de paga sus abuelos en comprar libros de aventuras. También se ha gastado 1/9 de la paga en comprar una bolsa de chuches. ¿Qué fracción de su paga se ha gastado María?",
	"Esta mañana Miguel ha comprado un kilo de boquerones. Para comer con su familia, ha hecho 3/4 de kilo. ¿Qué cantidad de boquerones quedan en la nevera? (Pulsa continuar para poder escribir la respuesta)" ,
	"Eva y Ana comparten una caja de bombones que han comprado entre las dos. Eva se ha comido 1/5 y Ana se ha comido 1/2. ¿Qué fracción de bombones se han comido entre ambas? (Pulsa continuar para poder escribir la respuesta)",
	"Mi hermano se ha comido dos tercios de un pastel, y yo me he comido un pastel y un tercio de otro. ¿Cuántos pasteles nos hemos comido entre los dos? (Pulsa continuar para poder escribir la respuesta)" 
	]
var answers = [
	4.0/9.0, 
	1.0/4.0,
	7.0/10.0,
	2.0
	]
var currentQuestion = 0
var correctAnswerCount = 0

func _ready() -> void:
	AnswerInput.hide()
	$SkippyAid.hide()
	super()

func help_accepted():
	accepted_help = true
	$SkippyAid.show()

func start_test():
	AnswerInput.hide()
	Dialogues = [questions[currentQuestion]]
	if (accepted_help):
		# hints[currentQuestion].show()
		print("Ahora se mostraría la ayuda de Skippy")
	DialogueUI.get_node("ContinueButton").disabled = false
	speak()



func end_dialogue():
	print("Test answer ended")
	if (currentQuestion >= questions.size()-1):
		print("Ending level")
		super()
		$"../../../..".finish_level_override(correctAnswerCount)
	else:
		print("Answering quesiton")
		for speaker in Speakers:
			speaker.hide()
		CurrentDialogue = -1
		DialogueUI.get_node("ContinueButton").disabled = true
		AnswerInput.show()

func received_answer(value):
	if (value == answers[currentQuestion]):
		correctAnswerCount += 1
	
	currentQuestion += 1
	start_test()
