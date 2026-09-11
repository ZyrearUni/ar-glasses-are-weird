extends Node

signal dialogue_ended

const DEFAULT_SPEAK_ANIMATION = "Hablar"

@onready var DialogueUI: CanvasLayer = get_tree().current_scene.get_node("DialogueUI/Canvas")
@onready var SpeakerName: RichTextLabel = get_tree().current_scene.get_node("DialogueUI/Canvas/SpeakerName")
@onready var DialogueAnimation: AnimationPlayer = get_tree().current_scene.get_node("DialogueUI/Canvas/DialogueAnimation")
@onready var DialogueText: RichTextLabel = get_tree().current_scene.get_node("DialogueUI/Canvas/DialogueText")

@export var Player: CharacterBody3D
@export var Dialogues: Array[String]
@export var SpeakerNames: Array[String]
@export var Speakers: Array[Node2D]
@export var SpeakerAnimations: Array[String]

var CurrentDialogue = -1
var selectedTalking = false

func _ready() -> void:
	DialogueUI.get_node("ContinueButton").connect("pressed", Callable(self, "continue_dialogue"))
	while (SpeakerAnimations.size() < Dialogues.size()):
		SpeakerAnimations.append(DEFAULT_SPEAK_ANIMATION)

func speak():
	DialogueUI.visible = true
	Player.inDialogue = true
	for speaker in Speakers:
		speaker.show()
	selectedTalking = true
	continue_dialogue()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func end_dialogue():
	Player.inDialogue = false
	DialogueUI.visible = false
	for speaker in Speakers:
		speaker.hide()
	CurrentDialogue = -1
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	selectedTalking = false
	dialogue_ended.emit()
	

func continue_dialogue() :
	if selectedTalking:
		CurrentDialogue += 1;
		if CurrentDialogue < Dialogues.size():
			DialogueText.text = Dialogues[CurrentDialogue] 
			SpeakerName.text = "[b]" + SpeakerNames[CurrentDialogue] 
			
			for speaker in Speakers:
				if (speaker.get_name() == SpeakerNames[CurrentDialogue]):
					speaker.play(SpeakerAnimations[CurrentDialogue])
				else:
					speaker.play("RESET")
			
			DialogueAnimation.play("RESET")
			DialogueAnimation.play("TextScroll")
		else:
			end_dialogue()
