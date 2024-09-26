extends Control
#MAIN MENU 

#on button pressed change scene to level select
func _on_play_pressed():
	get_tree().change_scene_to_file("res://ui scenes/level_select.tscn")


#on button pressed end game and quit
func _on_quit_pressed():
	get_tree().quit()


#on button pressed change scene to settings
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://ui scenes/settings_menu.tscn")



