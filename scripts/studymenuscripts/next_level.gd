extends Button

@export var nextLevel : String


func next_level(): 
	get_tree().change_scene_to_file(nextLevel)
