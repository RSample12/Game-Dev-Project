extends KinematicBody2D

var enemy_speed = 100
onready var pathfollow = get_parent()
var direction = 1

# 0: loop, 1: linear
export var enemy_type = 0
# 0: up, 1: down, 2: left, 3: right
export var start_anim = 0
var start = true

signal end_game

export (int) var detect_radius
var vis_color = Color(.867, .91, .247, .1)

func _ready():
	if start:
		start_anim()
		start = false
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
			get_anim($AnimatedSprite.animation)
			$AnimatedSprite.play()
			direction = 0
		else:
			if pathfollow.unit_offset >= .4 and self.name == "Enemy6":
				$AnimatedSprite.animation = "right"
			if pathfollow.unit_offset >= .46 and self.name == "Enemy7":
				$AnimatedSprite.animation = "left"
			pathfollow.offset += enemy_speed * delta
	else:
		if pathfollow.unit_offset == 0:
			$AnimatedSprite.stop()
			yield(get_tree().create_timer(3), "timeout")
			get_anim($AnimatedSprite.animation)
			$AnimatedSprite.play()
			direction = 1
		else:
			if pathfollow.unit_offset <= .4 and self.name == "Enemy6":
				$AnimatedSprite.animation = "up"
			if pathfollow.unit_offset <= .46 and self.name == "Enemy7":
				$AnimatedSprite.animation = "up"
			pathfollow.offset -= enemy_speed * delta
			

func _on_Visibility_body_entered(body):
	if "Player" in body.name:
		emit_signal("end_game")
		
func start_anim():
	if start_anim == 0:
		$AnimatedSprite.animation = "up"
	elif start_anim == 1:
		$AnimatedSprite.animation = "down"
	elif start_anim == 2:
		$AnimatedSprite.animation = "left"
	elif start_anim == 3:
		$AnimatedSprite.animation = "right"
		
		
func get_anim(animation):
	if animation == "up":
		if pathfollow.unit_offset == 1 or pathfollow.unit_offset == 0:
			$AnimatedSprite.animation = "down"
	elif animation == "down":
		if pathfollow.unit_offset == 1 or pathfollow.unit_offset == 0:
			$AnimatedSprite.animation = "up"
	elif animation == "left":
		if pathfollow.unit_offset == 1 or pathfollow.unit_offset == 0:
			$AnimatedSprite.animation = "right"
	elif animation == "right":
		if pathfollow.unit_offset == 1 or pathfollow.unit_offset == 0:
			$AnimatedSprite.animation = "left" 
