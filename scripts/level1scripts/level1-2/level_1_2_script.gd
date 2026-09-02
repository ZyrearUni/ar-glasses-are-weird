extends "res://scripts/level_template_script.gd"

func _on_accept_button_pressed() -> void:
	save_game_data(ACCEPT_GAME)


func _on_reject_button_pressed() -> void:
	save_game_data(REJECT_GAME)


func _on_level_finish_reject_body_entered(body: Node3D) -> void:
	if body == $stage/Player:
		finish_level()
