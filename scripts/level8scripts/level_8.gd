extends "res://scripts/level_template_script.gd"

var save_data
var AreaDialogues = []
var AreaSpeakerNames = []
var LunchDialogues = []
var LunchSpeakerNames = []

signal decision_allowed

func _ready() -> void:
	super()
	scenario_distinction("Escenario 8:")
	save_data = load_game_data()
	if (save_data.contains(SKIPPY_OFF)):
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
	
	else:
		$stage/house/DialogueArea.Speakers += $Skippy
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
