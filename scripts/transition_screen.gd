extends CanvasLayer


@onready var colorRect = $ColorRect
@onready var animationPlayer = $AnimationPlayer


func fade_to_black():
	colorRect.visible = true
	animationPlayer.play("Fade to black")

func fade_from_black():
	animationPlayer.play("Fade FROM black")
	colorRect.visible = false
