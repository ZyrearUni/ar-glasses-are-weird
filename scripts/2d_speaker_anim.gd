extends Sprite2D


func play(animation):
	if(animation != null):
		$AnimationPlayer.play(animation)
