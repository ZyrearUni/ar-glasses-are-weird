extends Control

@onready var animation = $Canvas/Animation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Canvas.hide()

func give_moral_insight(content: String):
	$Canvas.show()
	$Canvas/Insight.text = content
	await _play_animation()
	$Canvas.hide()

func _play_animation():
	animation.play("TextAnimation")
	await animation.animation_finished 
	animation.play("TextAnimation_Reverse")
	await animation.animation_finished
