extends Control


#on game click change scene to game
func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://ui scenes/loadingscreen/loading.tscn")

#change to the highscore screen 
func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://ui scenes/high_score_page.tscn")

func _on_backbutton_pressed():
	get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")