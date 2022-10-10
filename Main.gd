extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
export (PackedScene) var Mob
var score

func _ready():
	$Music.play()
  
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$Music.play()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$HUD.show_game_over()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func game_over():
	$ScoreTimer.stop()
	$DeathSound.play()

func _on_StartTimer_timeout():
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_HUD_start_game():
	pass # Replace with function body.
