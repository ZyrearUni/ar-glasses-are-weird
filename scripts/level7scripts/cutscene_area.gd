extends Area3D


@onready var dialogueOptions = [$Option0, $Option1, $Option2] 
var option = 0

func set_option(value: int) -> void:
	if value >= dialogueOptions.size():
		option = dialogueOptions.size() - 1
	elif value < 0:
		option = 0
	else:
		option = value

func _on_body_entered(body: Node3D) -> void:
	if body == $"../../Player":
		dialogueOptions[option].speak()
		monitoring = false
