extends Node3D

signal walk_tutorial_finished
@onready var areas = [$WalkArea1, $WalkArea2, $WalkArea3]

func _ready() -> void:
	for area in areas:
		area.visibility = false

func _on_walk_area_1_activate_next_area() -> void:
	areas[0].visibility = false
	areas[1].visibility = true


func _on_walk_area_2_activate_next_area() -> void:
	areas[1].visibility = false
	areas[2].visibility = true


func _on_walk_area_3_activate_next_area() -> void:
	areas[2].visibility = false
	walk_tutorial_finished.emit()
