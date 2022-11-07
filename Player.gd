extends KinematicBody2D

export (int) var player_speed

var screen_size_x
var screen_size_y
#export (int) var speed = 100
func _ready():
	hide()
	
func _process(delta):
	player_speed = 200
	
	var movement_direction := Vector2.ZERO
	if Input.is_action_pressed("walk"):
		player_speed = 75
		
	# Player Anim
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
	
	# Plays animation when player moves
	if movement_direction.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	movement_direction = movement_direction.normalized()
	move_and_slide(movement_direction * player_speed)
	#position.x = clamp(position.x, 0, screen_size_x)
	#position.y = clamp(position.y, 0, screen_size_y)
	

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	

func _on_Area2D_body_entered(body):
	if "Walls" in body.name and player_speed != 75:
		$wall_bump.play()
		
