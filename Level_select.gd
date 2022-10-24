extends Control


func _ready():
	$music.play()


func _on_tutorial_pressed():
	$music.stop()


func _on_level1_pressed():
	$music.stop()
