extends Node

var score
var scene = preload("res://Textbox.tscn")

  
func new_game():
	score = 0
	get_tree().paused = false
	$game_over.hide()
	$Player.start($StartPosition.position)
	$Music.play()
	$HUD.update_score(score)
	$HUD.show_message("")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass"volume_db"
func game_over():
	$ScoreTimer.stop()
	$Music.stop()
	$game_over.show()
	$HUD.show_game_over()
	$Player.hide()
	
func win_level():
	$ScoreTimer.stop()
	$Music.stop()
	$game_over.show()
	$HUD.show_win()
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
	$Gameover.play()
	game_over()
	
	

func _on_Sword_treasure_collected():
	$LevelWon.play()
	game_over()
	win_level()
	#yield(get_tree().create_timer(2), "timeout")
	#get_tree().change_scene("res://Level_select.tscn")

func _on_Diamond_jewel_collected():
	$LevelWon.play()
	game_over()
	win_level()



#func _on_Diamond_body_entered(body):
#	pass # Replace with function body.


func _on_Text_trigger_body_entered(body):
	if "Player" in body.name:
		#get_tree().paused = true
		var instance = scene.instance()
		add_child(instance)
		#yield(get_tree().create_timer(3), "timeout")
		#get_tree().paused = false
		
func _on_Crown_treasure_collected():
	$LevelWon.play()
	game_over()
	win_level()


var num_coins = 0
var coins_label = "Coins: 0"
func _on_Coin_collected_coin():
	num_coins += 1
	coins_label = "Coins: " + str(num_coins)
	$Coin_counter/Label.text = coins_label
