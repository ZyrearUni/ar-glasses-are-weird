extends "res://scripts/dialogue.gd"

signal level_finish


func end_dialogue():
	super()
	level_finish.emit()
	

func _on_visit_teacher_ending() -> void:
	$"../YesBlood/LotsOfBloodDecision/CanvasLayer".hide()
	speak()
