extends Control
#SETTING MENU


#on button pressed change scene to main menu
func _on_backbutton_pressed():
	$back_sound.playing = true
	get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")

#on difficuly button released change scene
func _on_difficulty_button_up() -> void:
	$enter_sound.playing = true
	get_tree().change_scene_to_file("res://ui scenes/difficulty_menu.tscn")
	



#########TODO###########
#implement a slider for controlling sound aswell as a toggle button to mute or unmute
func _on_sound_button_up() -> void:
	$enter_sound.playing = true
	get_tree().change_scene_to_file("res://ui scenes/sounds_fx.tscn")
