extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var scene = load("res://scenes/level_"+ str(PlayerData.nextLevel) +".tscn")

func teleport():
	animation_player.play("fade_in")
	await(animation_player.animation_finished)
	get_tree().change_scene_to_file("res://scenes/level_"+ str(PlayerData.nextLevel) +".tscn")
	

func _on_body_entered(_body: Node2D) -> void:
	PlayerData.nextLevel += 1
	PlayerData.saved_score = PlayerData.score
	teleport()
