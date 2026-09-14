extends Control

var RESULT_FILE_DIR = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP) + "/resultados.txt"
const SAVE_FILE = "user://saveFile.txt"

@onready var fade = $CanvasLayer/fade

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	await fade.fade_from_black()
	fade.hide()


func _on_salir_pressed() -> void:
	fade.show()
	await fade.fade_to_black()
	get_tree().quit()

func _on_empezar_pressed() -> void:
	# Crea o resetea el archivo para el estudio, en el escritorio para mayor facilidad
	var desktop_dir = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP)
	var file_path = desktop_dir + "/" + "resultados.txt"
	
	var file_result = FileAccess.open(file_path, FileAccess.WRITE)
	file_result.close()
		
		
	# Crea o resetea el archivo saveFile.txt
	var savefile = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	savefile.close()
	
	fade.show()
	await fade.fade_to_black()
	get_tree().change_scene_to_file("res://scenes/scenarios/Level_1-1.tscn")
