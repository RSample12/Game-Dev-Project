extends Area2D

signal treasure_collected

func _on_Sword_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("treasure_collected")
		queue_free()
