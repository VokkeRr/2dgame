extends Area2D

@onready var animation: AnimationPlayer = $AnimationPlayer
@export var score = 100


func _on_body_entered(_body: Node2D) -> void:
	pick()

func pick():
		animation.play("fade_out")
		PlayerData.score += score
