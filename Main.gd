extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
export (PackedScene) var Mob
var score

func _ready():
	$Music.play()

#func game_over():
	#$DeathSound.play()
  
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$Music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
