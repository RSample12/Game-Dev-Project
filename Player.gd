extends KinematicBody2D

export (int) var player_speed

var screen_size_x
var screen_size_y
#export (int) var speed = 100
func _ready():
	hide()
	
# warning-ignore:unused_argument
func _process(delta):
	player_speed = 200
	
	var movement_direction := Vector2.ZERO
	if Input.is_action_pressed("walk"):
		player_speed = 75
		
	# Player Anim
	if Input.is_action_pressed("move_right"):
		movement_direction.x = 1
		$AnimatedSprite.animation = "right"
		$Particles2D.rotation_degrees = 180
	if Input.is_action_pressed("move_left"):
		movement_direction.x = -1
		$AnimatedSprite.animation = "left"
		$Particles2D.rotation_degrees = 0
	if Input.is_action_pressed("move_down"):
		movement_direction.y = 1
		$AnimatedSprite.animation = "down"
		$Particles2D.rotation_degrees = 270
	if Input.is_action_pressed("move_up"):
		movement_direction.y = -1
		$AnimatedSprite.animation = "up"
		$Particles2D.rotation_degrees = 90
	
	# Plays animation when player moves
	if movement_direction.length() > 0:
		$AnimatedSprite.play()
		if player_speed == 200:
			$Particles2D.emitting = true
		else:
			$Particles2D.emitting = false
	else:
		$AnimatedSprite.stop()
		$Particles2D.emitting = false
		
	movement_direction = movement_direction.normalized()
# warning-ignore:return_value_discarded
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
		
