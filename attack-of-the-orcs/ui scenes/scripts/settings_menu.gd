extends Control
#SETTING MENU


#on button pressed change scene to main menu
func _on_backbutton_pressed():
	get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")

#########TODO##########
#implement a option for difficulty, using 3 buttons easy, medium,hard
func _on_difficulty_pressed():
	pass # Replace with function body.



#########TODO###########
#implement a slider for controlling sound aswell as a toggle button to mute or unmute
func _on_sound_pressed():
	pass # Replace with function body.
