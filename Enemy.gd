extends KinematicBody2D

var enemy_speed = 100
onready var pathfollow = get_parent()
var direction = 1

signal end_game

export (int) var detect_radius
var vis_color = Color(.867, .91, .247, .1)

func _ready():
	var shape = CircleShape2D.new()
	shape.radius = detect_radius
	$Visibility/CollisionShape2D.shape = shape
	
func _draw():
	draw_circle(Vector2(), detect_radius, vis_color)

func _process(delta):
	if direction == 1:
		if pathfollow.unit_offset == 1:
			$AnimatedSprite.stop()
			yield(get_tree().create_timer(3), "timeout")
			$AnimatedSprite.animation = "down"
			$AnimatedSprite.play()
			direction = 0
		else:
			pathfollow.offset += enemy_speed * delta
	else:
		if pathfollow.unit_offset == 0:
			$AnimatedSprite.stop()
			yield(get_tree().create_timer(3), "timeout")
			$AnimatedSprite.animation = "up"
			$AnimatedSprite.play()
			direction = 1
		else:
			pathfollow.offset -= enemy_speed * delta
			

func _on_Visibility_body_entered(body):
	if "Player" in body.name:
		print("dead")
		emit_signal("end_game")
