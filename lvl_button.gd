extends Button

export(PackedScene) var scene

#var original_size = $lvl_button.scale
#var grow_size = Vector2(1.1, 1.1)


"""func _on_lvl_button_mouse_entered():
	pass # Replace with function body.


func _on_lvl_button_mouse_exited():
	pass # Replace with function body.
	
func grow_btn(end_size: Vector2, duration: float):
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, 'scale', end_size, duration)"""


func _on_lvl_button_pressed():
	get_tree().change_scene_to(scene)
