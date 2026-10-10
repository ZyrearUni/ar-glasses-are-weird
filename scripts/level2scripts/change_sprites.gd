extends Node

@onready var Rodrigo = $"../Classroom/Kids/Rodrigo"

func change_rodrigo():
	Rodrigo.get_node("Sprite3D").texture = load("res://assets/sprites/Kids/rodrisad.png")
	
	Rodrigo.change_dialogue()
	
	for i in Rodrigo.Dialogues.size():
		Rodrigo.SpeakerNames[i] = "Rodrigo"

	Rodrigo.Speakers.append($"../../Rodrigo")
