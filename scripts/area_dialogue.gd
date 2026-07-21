extends CollisionShape3D

@export var Player : Node3D
@onready var Area :  Area3D = $".."


func _on_area_3d_body_entered(body: Node3D) -> void:
	Area.init_dialogue(body)
