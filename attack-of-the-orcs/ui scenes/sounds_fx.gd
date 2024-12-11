extends Control



func _on_backbutton_button_up() -> void:
	get_tree().change_scene_to_file("res://ui scenes/settings_menu.tscn")
