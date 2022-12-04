extends Area2D

signal treasure_collected 

# Called when the node enters the scene tree for the first time.
func _on_Diamond_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("player"):
		emit_signal("treasure_collected")
		queue_free()
