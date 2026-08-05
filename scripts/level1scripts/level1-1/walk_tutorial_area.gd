extends Node3D

signal walk_tutorial_finished
@onready var areas = [$WalkArea1, $WalkArea2, $WalkArea3]

func _ready() -> void:
	for area in areas:
		area.monitoring = false
		
func _on_world_level_start() -> void:
	areas[0].show()
	areas[0].monitoring = true

func _on_walk_area_1_activate_next_area() -> void:
	areas[0].hide()
	areas[0].monitoring = false
	areas[1].show()
	areas[1].monitoring = true

func _on_walk_area_2_activate_next_area() -> void:
	areas[1].hide()
	areas[1].monitoring = false
	areas[2].show()
	areas[2].monitoring = true

func _on_walk_area_3_activate_next_area() -> void:
	areas[2].hide()
	areas[2].monitoring = false
	walk_tutorial_finished.emit()
