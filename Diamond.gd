extends Area2D

signal jewel_collected

# Called when the node enters the scene tree for the first time.

func _on_Diamond_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("jewel_collected")
		queue_free()
