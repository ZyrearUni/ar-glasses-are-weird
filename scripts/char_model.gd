extends Node3D

@onready var animation : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func idle():
	animation.play("Idle")

func walk():
	animation.play("Walk")

func run():
	animation.play("Run")

func crouch():
	animation.play("Crouch")

func crouch_walk():
	animation.play("Crouch Walk")

func jump():
	animation.play("Jump")

func fall():
	animation.play("Fall")
