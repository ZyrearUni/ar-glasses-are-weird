extends "res://scripts/level_template_script.gd"

const TOTAL_COINS = 5
var total_coins_collected = 0

func _ready() -> void:
	Player.look_at_somewhere($"stage/Schoolyard/Platform section".global_position)
	super()
	$"stage/Schoolyard/Platform section".hide()
	speak()

func end_dialogue():
	await fade.fade_to_black()
	super()
	$"stage/Schoolyard/Platform section".show()
	await fade.fade_from_black()
	$stage/IntroductionDialogue.speak()

func coin_collected(body):
	if (body == Player):
		total_coins_collected += 1
		if (total_coins_collected == TOTAL_COINS):
			await fade.fade_to_black()
			$BokenBone.play()
			$stage/EndingDialogue.speak()

func finish_level() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	$Study/CanvasLayer.show()
