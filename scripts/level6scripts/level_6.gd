extends "res://scripts/level_template_script.gd"



# Final 1
func _on_dont_tell_dialogue_ended() -> void:
	pass # Replace with function body.

# Final 2
func _on_activate_suscription_dialogue_ended() -> void:
	insightContent = "" #TODO
	finish_level()

# Final 3
func _on_do_not_activate_suscription_dialogue_ended() -> void:
	insightContent = "" #TODO
	finish_level()

# Final 4
func _on_tell_teacher_dialogue_ended() -> void:
	fade.fade_to_black()
	$stage/City/CutsceneArea/Tell/TellTeacher/TeacherInteraction.speak()
	await $stage/City/CutsceneArea/Tell/TellTeacher/TeacherInteraction.dialogue_ended
	insightContent = "" #TODO
	finish_level()


func _on_intervene_dialogue_ended() -> void:
	pass
