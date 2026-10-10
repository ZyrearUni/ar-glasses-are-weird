extends "res://scripts/level_template_script.gd"

@onready var DialogueArea = $stage/house/DialogueArea
@onready var Lunch = $stage/house/LunchDialogue
@onready var Tell = $stage/house/DialogueArea/Decision/CanvasLayer/Tell
@onready var PoliceDark = $stage/house/PoliceDarkDialogue

var save_data

var AreaDialogues : Array[String] = []
var AreaSpeakerNames : Array[String] = []
var AreaSpeakerAnimations : Array[String] = []

var LunchDialogues : Array[String] = ["Y... ¿Qué tal las clases?"]
var LunchSpeakerNames : Array[String] = ["Mamá"]
var LunchSpeakerAnimations : Array[String] = ["Hablar"]

var YesTellDialogues : Array[String] = []
var YesTellSpeakerNames : Array[String] = []
var YesTellSpeakerAnimations : Array[String] = []

var DarkDialogues : Array[String] = []
var DarkSpeakerNames : Array[String] = []
var DarkSpeakerAnimations : Array[String] = []

signal decision_allowed

func _AreaSetUp(data):
	if (data.contains(SKIPPY_OFF)):
		decision_allowed.emit()
		
		AreaDialogues += [
			"Oh, cariño. No te había escuchado entrar.",
			"Se supone que tu amiguito debería haberme avisado.",
			"¿Ha pasado algo?"
		]
		AreaSpeakerNames += [
			"Mamá",
			"Mamá",
			"Mamá",
		]
		AreaSpeakerAnimations += [
			"Hablar",
			"Hablar",
			"Hablar"
		]
	else:
		DialogueArea.add_speaker($Skippy)
		AreaDialogues += [
			"¡Hola, mi estrellita! Justo estaba revisando la información que tu coleguilla me había enviado.",
			"Muchas gracias por tenerle siempre un ojo encima.",
			"¡Sin problema! Aunque ahora mismo estamos un pelín cansados ambos... ¿Verdad, superestrella?",
			"Mientras coméis yo voy a tomarme un descanso.",
			"¡Claro! Íbamos a comer ya, de todas formas."
		]
		AreaSpeakerNames += [
			"Mamá",
			"Mamá",
			"Skippy",
			"Skippy",
			"Mamá",
		]
		AreaSpeakerAnimations += [
			"Hablar",
			"Hablar",
			"Hablar",
			"Hablar",
			"Hablar"
		]
		
	DialogueArea.Dialogues += AreaDialogues
	DialogueArea.SpeakerNames += AreaSpeakerNames
	DialogueArea.SpeakerAnimations += AreaSpeakerAnimations


func _LunchSetUp(data):
	if (data.contains(ACCEPT_GAME)):
		LunchDialogues.append("Ya sabes, las clases a las que has llegado tarde. Seguro han dicho algo importante.")
		LunchSpeakerNames.append("Mamá")
		LunchSpeakerAnimations.append("Hablar") # TODO Cambiar
	else:
		LunchDialogues += [
			"Bien, tuve unos ejercicios de mates.",
			"¿Unos ejercicios? ¿Y te salieron bien?"
		]
		LunchSpeakerNames += [
			"Tú",
			"Mamá"
		]
		LunchSpeakerAnimations += [
			"Hablar",
			"Hablar"
		]
		
		if (data.contains(ACCEPT_HELP_CLASS)):
			LunchDialogues += [
				"Sí, Skippy me ayudó bastante.",
				"Vaya, pues sí que son útiles las gafas. Me alegro mucho."
			]
		else:
			LunchDialogues += [
				"Sí, los hice yo por mi cuenta.",
				"¿SIN AYUDA? Qué orgullosa estoy de ti."
			]
			LunchSpeakerNames += [
				"Tú",
				"Mamá"
			]
			LunchSpeakerAnimations += [
				"Hablar",
				"Hablar"
			]
		
		if (data.contains(REGISTERED_WOUND)):
			LunchDialogues.append("Me ha dicho tu amiguito que tuviste un pequeño accidente en el patio... ¿Me dejas ver tu pierna, por favor?",)
			LunchSpeakerNames.append("Mamá")
			LunchSpeakerAnimations.append("Hablar")
	
	Lunch.Dialogues += LunchDialogues
	Lunch.SpeakerNames += LunchSpeakerNames
	Lunch.SpeakerAnimations += LunchSpeakerAnimations


func _YesTellSetUp(data):
	if (data.contains(TELL_TEACHER)):
		YesTellDialogues += [
			"Se lo conté a la profesora.",
			"Ah... Menos mal. Pero supongo que tu amigo virtual no querrá ser molestado de momento.",
			"Vamos a comer, anda. Así me cuentas de tu día."
		]
		YesTellSpeakerNames += [
			"Tú",
			"Mamá",
			"Mamá"
		]
		YesTellSpeakerAnimations += [
			"Hablar",
			"Hablar",
			"Hablar"
		]
	else:
		YesTellDialogues += [
			"Llamé a la policía, Skippy se encargó de pagar la suscripción...",
			"¿QUE TUVISTE QUE PAGAR UNA SUSCRIPCIÓN?",
			"Es que es increíble, en serio. Con lo que costó la broma y encima haciendo eso.",
			"... No te preocupes mi vida, hiciste lo correcto. ¿Vale?",
			"Ya me encargaré yo de lidiar con los pagos esos..."
		]
		YesTellSpeakerNames += [
			"Tú",
			"Mamá",
			"Mamá",
			"Mamá",
			"Mamá"
		]
		YesTellSpeakerAnimations += [
			"Hablar",
			"Hablar",
			"Hablar"
		]
	
	Tell.Dialogues += YesTellDialogues
	Tell.SpeakerNames += YesTellSpeakerNames
	Tell.SpeakerAnimations += YesTellSpeakerAnimations


func _PoliceDarkSetUp(data):
	if(data.contains(ACCEPT_GAME)):
		DarkDialogues += [
			"Cuando venga la policía puedes despedirte de tu amiguito virtual.",
			"Entre la suscripción y el hacerte perder clase, no merece la pena. Voy a devolver las gafas."
		]
		DarkSpeakerNames += [
			"Mamá",
			"Mamá"
		]
	elif(data.contains(RAQUEL_FRIEND)):
		DarkDialogues.append("Esperemos encuentren a tu nueva amiga pronto...")
		DarkSpeakerNames.append("Mamá")
	else:
		if(data.contains(REGISTERED_WOUND)):
			var value = data.to_int()
			if (value <= 3):
				DarkDialogues.append("¿Cómo está tu moratón, mi vida?")
				DarkSpeakerNames.append("Mamá")
			elif (value > 3 && value <= 6):
				DarkDialogues.append("Deja que te revise la herida, anda")
				DarkSpeakerNames.append("Mamá")
			else:
				DarkDialogues.append("¿Por qué tienes una venda en la pierna, cariño...?")
				DarkSpeakerNames.append("Mamá")
	
	PoliceDark.Dialogues = DarkDialogues
	PoliceDark.SpeakerNames = DarkSpeakerNames
	PoliceDark.SpeakerAnimations = DarkSpeakerAnimations


func _ready() -> void:
	super()
	scenario_distinction("Escenario 8:")
	save_data = load_game_data()
	
	# Decidir qué rama de diálogo se va a usar según lo que se haya decidido en los escenarios anteriores.
	_AreaSetUp(save_data)
	_LunchSetUp(save_data)
	_YesTellSetUp(save_data)
	_PoliceDarkSetUp(save_data)


func end_dialogue():
	super()
	end_game()
