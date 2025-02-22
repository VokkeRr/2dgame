extends CharacterBody2D

var speed = 600
@export var gravity = 5000
var jump_hight = 1500
var bouse_impulse = 2300

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("move_left","move_right")
	velocity.y += gravity * delta
	velocity.x = direction * speed

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jump_hight

	 #Менаника прыжка - высота зависит от времени удержания клавиши (Отказался временно)
	#if Input.is_action_just_released("jump") and velocity.y < 0:
		#velocity.y = 0

	move_and_slide()


func _on_detector_area_entered(_area: Area2D) -> void:
	velocity.y = 0 
	velocity.y -= bouse_impulse


func _on_detector_body_entered(_body: Node2D) -> void:
	die()

func die():
	PlayerData.death += 1
	PlayerData.deth_trigered = true
	#get_tree().call_deferred("reload_current_scene")
