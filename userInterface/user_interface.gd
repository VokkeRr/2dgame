extends Control

@onready var label: Label = $Label
@onready var pause_overlay: ColorRect = $PauseOverlay
@onready var title: Label = $PauseOverlay/Title


var pause = false:
	set(new_value):
		pause = new_value
		pause_overlay.visible = pause
		get_tree().paused = pause

func player_died():
	title.text = "YOU LOSE"
	pause = !pause

func _ready() -> void:
	PlayerData.connect("score_updated", score_update)
	PlayerData.player_died.connect(player_died)
	score_update()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and title.text != "YOU LOSE":
		self.pause = !pause
		#game_paused()


func score_update():
	label.text = "Score: %s" % PlayerData.score
	
## Alternative way to pause (need to uncomment function in input)
#func game_paused():  
	#pause = !pause
	#pause_overlay.visible = pause
	#get_tree().paused = pause
