extends Node

signal score_updated
signal player_died

var nextLevel = 1
var saved_score = 0
var deth_trigered = false

var score: = 0:
	set(new_score):
		score = new_score
		score_updated.emit()

var death: = 0: 
	set(count):
		death = count
		player_died.emit()
 
func reset() -> void:
	score = 0
	death = 0
	saved_score = 0
	nextLevel = 1
