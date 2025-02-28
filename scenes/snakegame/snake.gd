extends Node2D

class_name Snake

@onready var snake_parts: Node = $SnakeParts
const BODY_SEGMENT_SIZE = 32
const SNAKE = preload("res://assets/Snake.png")
var body_parts = []
var move_direction:= Vector2.ZERO

func _ready() -> void:
	var head: = Sprite2D.new()
	head.position = Vector2.ZERO
	head.scale = Vector2(1,1)
	head.texture = SNAKE
	snake_parts.add_child(head)
	body_parts.append(head)
	

	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_left") && move_direction.x != 1:
		move_direction = Vector2.LEFT
	elif event.is_action_pressed("move_right") && move_direction.x != -1:
		move_direction = Vector2.RIGHT
	elif event.is_action_pressed("move_up") && move_direction.y != 1:
		move_direction = Vector2.UP
	elif event.is_action_pressed("move_down") && move_direction.y != -1:
		move_direction = Vector2.DOWN


func _on_timer_timeout() -> void:
	var new_head_position = position + move_direction * BODY_SEGMENT_SIZE
	print(new_head_position)
	move_to_position(new_head_position)
	if position.x < -874 or position.x > 816 or position.y < -440 or position.y > 432:
		print ("dead")
	
	
func move_to_position(new_position):
	if body_parts.size() > 1:
		var last_element = body_parts.pop_back()
		last_element.position = body_parts[0].position
		body_parts.insert(1, last_element)
	
	position = new_position
	body_parts[0].position = new_position

func add_body_part():
	var new_part = Sprite2D.new()
	new_part.texture = SNAKE
	new_part.scale = Vector2(0.8,0.8)
	snake_parts.add_child(new_part)
	new_part.position = body_parts[-1].position - move_direction * BODY_SEGMENT_SIZE
	body_parts.append(new_part)
