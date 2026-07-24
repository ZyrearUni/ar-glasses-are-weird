extends ColorRect

func fade_from_black():
	var tween : Tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.5).from(1.0)
	await tween.finished

func fade_to_black():
	var tween : Tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.5).from(0.0)
	await tween.finished
