extends "res://scripts/dialogue.gd"

func init_dialogue(body : Node3D):
	if body == Player:
		speak()
