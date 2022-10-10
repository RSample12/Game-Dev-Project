extends KinematicBody2D

export (int) var player_speed

var screen_size_x
var screen_size_y
#export (int) var speed = 100
func _ready():
	screen_size_x = 1024
	screen_size_y = 1920
	
func _process(delta):
	player_speed = 150
	
	var movement_direction := Vector2.ZERO
	if Input.is_action_pressed("walk"):
		player_speed = 75
	if Input.is_action_pressed("move_right"):
		movement_direction.x = 1
		$AnimatedSprite.animation = "right"
	if Input.is_action_pressed("move_left"):
		movement_direction.x = -1
		$AnimatedSprite.animation = "left"
	if Input.is_action_pressed("move_down"):
		movement_direction.y = 1
		$AnimatedSprite.animation = "down"
	if Input.is_action_pressed("move_up"):
		movement_direction.y = -1
		$AnimatedSprite.animation = "up"
	
	if movement_direction.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	movement_direction = movement_direction.normalized()
	move_and_slide(movement_direction * player_speed)
	position.x = clamp(position.x, 0, screen_size_x)
	position.y = clamp(position.y, 0, screen_size_y)

