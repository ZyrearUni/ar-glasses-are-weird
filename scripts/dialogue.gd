extends Node

@onready var DialogueUI: CanvasLayer = get_tree().current_scene.get_node("DialogueUI/Canvas")
@onready var SpeakerName: RichTextLabel = get_tree().current_scene.get_node("DialogueUI/Canvas/SpeakerName")
@onready var DialogueAnimation: AnimationPlayer = get_tree().current_scene.get_node("DialogueUI/Canvas/DialogueAnimation")
@onready var DialogueText: RichTextLabel = get_tree().current_scene.get_node("DialogueUI/Canvas/DialogueText")
@onready var Player: CharacterBody3D = $"../Player"

@export var Dialogues: Array[String]
@export var SpeakerNames: Array[String]
@export var SpeakerAnimation: AnimationPlayer

var CurrentDialogue = -1

func _ready() -> void:
	DialogueUI.get_node("ContinueButton").connect("pressed", Callable(self, "continue_dialogue"))
	print(Player)

func speak():
	DialogueUI.visible = true
	Player.inDialogue = true
	continue_dialogue()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func end_dialogue():
	Player.inDialogue = false
	DialogueUI.visible = false
	SpeakerAnimation.play("RESET")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func continue_dialogue() :
	CurrentDialogue += 1;
	if CurrentDialogue < Dialogues.size():
		DialogueText.text = Dialogues[CurrentDialogue]
		SpeakerName.text = SpeakerNames[CurrentDialogue]
		
		# When speaker is not player, change to speaking sprite
		if "You" not in SpeakerName.text:
			SpeakerAnimation.play("Talk")
		else:
			SpeakerAnimation.play("RESET")
		
		DialogueAnimation.play("RESET")
		DialogueAnimation.play("TextScroll")
	else:
		end_dialogue()
