extends Node2D

@onready var fade = $CanvasLayer/fade
@onready var Animator = $CanvasLayer/AnimationPlayer

func _ready() -> void:
	await fade.fade_from_black()
	Animator.play("TextScroll")
	await Animator.animation_finished
	await get_tree().create_timer(4).timeout
	Animator.play_backwards("TextScroll")
	await Animator.animation_finished
	Animator.play("FinalThanks")
	await Animator.animation_finished
	await get_tree().create_timer(4).timeout
	Animator.play_backwards("FinalThanks")
	await Animator.animation_finished
	await fade.fade_to_black()
	await $CreditsTheme.fade_out()
	get_tree().quit()
