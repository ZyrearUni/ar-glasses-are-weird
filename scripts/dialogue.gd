extends Node

@onready var DialogueUI: CanvasLayer = get_tree().current_scene.get_node("DialogueUI/Canvas")
@onready var SpeakerName: RichTextLabel = get_tree().current_scene.get_node("DialogueUI/Canvas/SpeakerName")
@onready var DialogueAnimation: AnimationPlayer = get_tree().current_scene.get_node("DialogueUI/Canvas/DialogueAnimation")
@onready var DialogueText: RichTextLabel = get_tree().current_scene.get_node("DialogueUI/Canvas/DialogueText")
@export var Player: CharacterBody3D

@export var Dialogues: Array[String]
@export var SpeakerNames: Array[String]
@export var SpeakerAnimation: AnimationPlayer

var CurrentDialogue = -1
var selectedTalking = false

func _ready() -> void:
	DialogueUI.get_node("ContinueButton").connect("pressed", Callable(self, "continue_dialogue"))

func speak():
	DialogueUI.visible = true
	Player.inDialogue = true
	selectedTalking = true
	continue_dialogue()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func end_dialogue():
	Player.inDialogue = false
	DialogueUI.visible = false
	CurrentDialogue = -1
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	selectedTalking = false
	SpeakerAnimation.play("RESET")

func continue_dialogue() :
	if selectedTalking:
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
