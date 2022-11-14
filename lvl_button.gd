extends Button

export(PackedScene) var scene

func _on_lvl_button_pressed():
	get_tree().change_scene_to(scene)
