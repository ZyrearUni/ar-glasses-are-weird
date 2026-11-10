extends Button

@export var nextLevel : String
@onready var aspnegativos = $"../HBoxContainer/Aspectos negativos"
@onready var asppositivos = $"../HBoxContainer/Aspectos positivos"
var RESULT_FILE_DIR = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP) + "/resultados.txt"

func next_level(): 
	var explanation = ""
	if (asppositivos != null):
		for child in asppositivos.get_children():
			if (child.risk && child.visible):
				var file = FileAccess.open(RESULT_FILE_DIR, FileAccess.READ_WRITE)
				file.seek_end()
				file.store_string("NO Identificado: " + child.aspecto + "\n")
	
	if (aspnegativos != null): 
		for child in aspnegativos.get_children():
			if (child.risk && child.visible):
				var file = FileAccess.open(RESULT_FILE_DIR, FileAccess.READ_WRITE)
				file.seek_end()
				file.store_string("NO Identificado: " + child.aspecto + "\n")
				if (explanation == ""):
					explanation = (child.explanation + "\n" + "\n")
				else:
					explanation += (child.explanation + "\n" + "\n")
	
	$"..".hide()
	if (explanation != ""): 
		$"../../RiesgosExplicados".text += explanation
		$"../../../AnimationPlayer".play("TextScroll")
		await $"../../../AnimationPlayer".animation_finished
		await get_tree().create_timer(10).timeout
		$"../../../AnimationPlayer".play_backwards("TextScroll")
		await $"../../../AnimationPlayer".animation_finished
	get_tree().change_scene_to_file(nextLevel)
