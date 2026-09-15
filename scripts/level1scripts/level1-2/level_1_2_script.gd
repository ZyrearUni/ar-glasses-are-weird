extends "res://scripts/level_template_script.gd"

const TOTAL_COINS = 7
var total_coins_collected = 0

func _on_accept_button_pressed() -> void:
	save_game_data(ACCEPT_GAME)


func _on_reject_button_pressed() -> void:
	save_game_data(REJECT_GAME)


func _on_level_finish_reject_body_entered(body: Node3D) -> void:
	if body == $stage/Player:
		finish_level()

func coin_collected(body):
	if (body == Player):
		total_coins_collected += 1
		print(total_coins_collected)
		if (total_coins_collected == TOTAL_COINS):
			finish_level()
