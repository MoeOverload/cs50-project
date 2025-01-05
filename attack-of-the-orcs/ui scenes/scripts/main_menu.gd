extends Control
#MAIN MENU 

#on button pressed change scene to level select
func _on_play_button_up():
	$enter_sound.playing = true
	Globalscript.set_difficulty()
	get_tree().change_scene_to_file("res://ui scenes/loadingscreen/loading.tscn")
	Globalscript.round_change = false
	Globalscript.current_enemy_number = 0
	Globalscript.rounds_counter = 1
	
#on button pressed end game and quit
func _on_quit_button_up() -> void:
	$back_sound.playing = true
	get_tree().quit()
	

#on button pressed change scene to settings
func _on_settings_button_up() -> void:
	$enter_sound.playing = true
	get_tree().change_scene_to_file("res://ui scenes/settings_menu.tscn")



func _on_high_scores_button_up() -> void:
	$enter_sound.playing = true
	get_tree().change_scene_to_file("res://ui scenes/high_score_page.tscn")



func _on_credits_button_up() -> void:
	$enter_sound.playing =  true 
	get_tree().change_scene_to_file("res://ui scenes/credits_page.tscn")
