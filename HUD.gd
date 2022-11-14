extends CanvasLayer

signal start_game


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$MessageLabel.text = "Castlebreaker"
	$MessageLabel.show()
	get_tree().paused = true
	get_tree().reload_current_scene()

func show_win():
	show_message("You've found the treasure!")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Returning to Main Menu..."
	$MessageLabel.show()
	yield(get_tree().create_timer(2), "timeout")
	get_tree().change_scene("res://Level_select.tscn")
	
func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$MessageLabel.hide()
