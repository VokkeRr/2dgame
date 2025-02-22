extends CharacterBody2D

var gravity = 5000
@export var enemy_speed = 200
@export var score = 500
@onready var sprite_2d: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if is_on_wall():
		velocity.x *= -1.0
	if velocity.x == 0:
		velocity.x -= enemy_speed
	
	move_and_slide()



func _on_bounse_area_area_entered(_area: Area2D) -> void:
	die()
	
func die():
	sprite_2d.modulate = Color("d6c1b4")
	$CollisionShape2D.set_deferred("disabled",true)
	PlayerData.score += score
	await get_tree().create_timer(1.0).timeout
	queue_free()
