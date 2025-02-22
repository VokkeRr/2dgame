extends Button

@export var scene : = ""
#const LEVEL_1 = preload("res://scenes/level_1.tscn")

func _on_pressed() -> void:
	#get_tree().change_scene_to_packed(scene)
	PlayerData.reset()
	get_tree().paused = false
	get_tree().change_scene_to_file(scene)
