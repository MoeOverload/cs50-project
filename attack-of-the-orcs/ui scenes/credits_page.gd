extends Control




func _on_button_button_up() -> void:
	$back_sound.playing = true
	get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")
