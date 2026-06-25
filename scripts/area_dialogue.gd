extends CollisionShape3D

@onready var Player : Node3D = $"../../Player"
@onready var Area :  Area3D = $".."


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == Player:
		Area.speak()
