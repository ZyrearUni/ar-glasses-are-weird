extends Button

@export var nextLevel : String


func next_level(): 
	var explanation = ""
	for child in $"../HBoxContainer/Aspectos negativos".get_children():
		if (child.risk && child.visible):
			if (explanation == ""):
				explanation = child.explanation
			else:
				explanation += (child.explanation + "\n" + "\n")
	$"..".hide()
	if (explanation != ""): 
		$"../../RiesgosExplicados".text = explanation
		$"../../../AnimationPlayer".play("TextScroll")
		await $"../../../AnimationPlayer".animation_finished
		await get_tree().create_timer(2).timeout
		$"../../../AnimationPlayer".play_backwards("TextScroll")
		await $"../../../AnimationPlayer".animation_finished
	get_tree().change_scene_to_file(nextLevel)
