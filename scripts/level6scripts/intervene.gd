extends "res://scripts/dialogue.gd"

func _on_intervene() -> void:
	$KidnappedEnding.monitoring = true
	speak()
