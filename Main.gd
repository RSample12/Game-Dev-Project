extends Node

var score


func _ready():
	#$Music.play()
	pass
  
func new_game():
	score = 0
	get_tree().paused = false
	$Player.start($StartPosition.position)
	$Music.play()
	$HUD.update_score(score)
	$HUD.show_message("")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func game_over():
	$ScoreTimer.stop()
	$Music.stop()
	#$DeathSound.play()
	$HUD.show_game_over()
	$Player.hide()
	
func _on_StartTimer_timeout():
	$ScoreTimer.start()
	score += 1
	$HUD.update_score(score)
	
func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_HUD_start_game():
	new_game()
	
func _on_Enemy_end_game():
	game_over()
