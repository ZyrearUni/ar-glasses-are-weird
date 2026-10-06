extends "res://scripts/dialogue_area_activation.gd"

var allowed_decision = false

func allow_decision():
	allowed_decision = true


func init_dialogue(body : Node3D):
	if(body == Player):
		Player.look_at_somewhere($"../Mom".global_position)
		speak()

func end_dialogue():
	await $"../../../fade".fade_to_black()
	super()
	# Teleport player to table
	await $"../../../fade".fade_from_black()
