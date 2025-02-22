extends Button

func _on_button_up() -> void:
	if PlayerData.deth_trigered == false:
		PlayerData.death += 1
	PlayerData.score = PlayerData.saved_score
	get_tree().paused = false
	get_tree().reload_current_scene()
	PlayerData.deth_trigered = false
	
