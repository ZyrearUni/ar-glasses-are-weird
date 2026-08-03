extends Control

@onready var Player: CharacterBody3D = $"../stage/Player"
@onready var DialogueMenu = $"../DialogueUI"
var isPaused = false

func _ready() -> void:
	self.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause_unpause()

func pause_unpause():
	isPaused = !isPaused
	get_tree().paused = isPaused
	self.visible = isPaused
	
	if isPaused:
		DialogueMenu.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		DialogueMenu.show()
		if Player.inDialogue == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_continuar_pressed() -> void:
	pause_unpause()


func _on_unstuck_pressed() -> void:
	Player.unstuck()


func _on_salir_pressed() -> void:
	get_tree().quit()
