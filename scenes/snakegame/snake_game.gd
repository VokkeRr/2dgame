extends Node2D

@onready var snake: Snake = $Snake
const FOOD = preload("res://assets/Food.png")
@onready var container_for_food: Node = $ContainerForFood
var food_position = Vector2.ZERO
@onready var new_food = Sprite2D.new()

func _ready() -> void:
	new_food.texture = FOOD

func _on_food_timer_timeout() -> void:
	food_position = Vector2(randi_range(-800,784),randi_range(-408,400))
	add_new_food()
	

func add_new_food():
	container_for_food.add_child(new_food)
