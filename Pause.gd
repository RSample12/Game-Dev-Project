extends Control


func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state

func _on_controls_pressed():
	$controls.hide()
	$Objective.hide()
	$control_screen.show()
	$back_button.show()
	$exit.hide()
	

func _on_back_button_pressed():
	$controls.show()
	$control_screen.hide()
	$Objective.show()
	$objective_screen.hide()
	$back_button.hide()
	$exit.show()


func _on_exit_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Level_select.tscn")


func _on_Objective_pressed():
	$Objective.hide()
	$control_screen.hide()
	$objective_screen.show()
	$back_button.show()
	$exit.hide()
