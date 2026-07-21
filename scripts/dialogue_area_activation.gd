extends "res://scripts/dialogue.gd"


func _ready() -> void:
	super()
	SpeakerAnimation = $AnimationPlayer

func init_dialogue(body : Node3D):
	if body == Player:
		speak()

func speak():
	super()
