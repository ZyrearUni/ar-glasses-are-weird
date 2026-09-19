extends AudioStreamPlayer


func fade_out():
	var tween =  create_tween()
	tween.tween_property(self, "volume_linear", 0, 0.5)
	await tween.finished
	
