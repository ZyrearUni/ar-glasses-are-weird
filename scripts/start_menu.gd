extends Control

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
	# Crea o resetea el archivo saveFile.txt
	var file = FileAccess.open("res://saveFile.txt", FileAccess.WRITE)
	file.close()
	
	fade.show()
	await fade.fade_to_black()
	get_tree().change_scene_to_file("res://scenes/scenarios/Level_1-1.tscn")
