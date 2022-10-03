extends Area2D


var enemy_speed = 100
onready var pathfollow = get_parent()
var direction = 1

func _process(delta):	
	if direction == 1:
		if pathfollow.unit_offset == 1:
			$AnimatedSprite.stop()
			yield(get_tree().create_timer(3), "timeout")
			$AnimatedSprite.play()
			direction = 0
		else:
			pathfollow.offset += enemy_speed * delta
	else:
		if pathfollow.unit_offset == 0:
			$AnimatedSprite.stop()
			yield(get_tree().create_timer(3), "timeout")
			$AnimatedSprite.play()
			direction = 1
		else:
			pathfollow.offset -= enemy_speed * delta
