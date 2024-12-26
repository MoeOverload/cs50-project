extends Control



func _on_backbutton_button_up() -> void:
	get_tree().change_scene_to_file("res://ui scenes/settings_menu.tscn")

#master volume control
func _on_check_button_toggled():
	pass
	
	
#music mute cntrol
func _on_musicmute_toggled():
	pass # Replace with function body.

#sound fx control
func _on_soundfx_mute_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.
