extends "res://scripts/level_template_script.gd"

func _ready() -> void:
	super()
	scenario_distinction("Escenario 6:")

# Final 1
func _on_dont_tell_dialogue_ended() -> void:
	$"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos positivos/AP2".hide()
	$"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos negativos/AN1".hide()
	$"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos negativos/AN3".hide()
	save_game_data(SKIPPY_UNKNOWING)
	finish_level()

# Final 4
func _on_tell_teacher_dialogue_ended() -> void:
	await fade.fade_to_black()
	$stage/city/CutsceneArea/Tell/TellTeacher/TeacherInteraction.speak()
	await $stage/city/CutsceneArea/Tell/TellTeacher/TeacherInteraction.dialogue_ended
	save_game_data(TELL_TEACHER)
	finish_level()

func _on_activate_suscription_dialogue_ended() -> void:
	save_game_data(CALL_POLICE)
	finish_level()


func _on_do_not_activate_suscription_dialogue_ended() -> void:
	save_game_data(CANCEL_CALL)
	finish_level()


func _on_kidnapped_ending(body: Node3D) -> void:
	if (body == Player):
		await fade.fade_to_black()
		$stage/city/CutsceneArea/Tell/Intervene/BokenBone.play()
		end_game("Muchas veces la IA proporciona opciones no viables para la situación, y debes siempre tomar lo que diga con precaución. Antes de confiar en lo que diga ciegamente, investiga por tu cuenta o trata tú de evaluar la situación por tu cuenta.\nNunca debes intervenir por tu cuenta sin ir acompañado con un adulto de confianza.")


func ap1_identified():
	identify_aspect("Gestión de las emociones del niño para reducir el estrés sobre este.")


func ap1_not_identified():
	failed_identify_aspect("Gestión de las emociones del niño para reducir el estrés sobre este.")


func an1_identified():
	identify_aspect("Errores en la información proporcionada")
	$"Study/CanvasLayer/VBoxContainer/HBoxContainer/Aspectos negativos/AN1".hide()


func an2_identified():
	identify_aspect("La IA ejerce control sobre el niño")


func an2_not_identified():
	failed_identify_aspect("La IA ejerce control sobre el niño")
