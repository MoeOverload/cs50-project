extends Control



func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://ui scenes/loadingscreen/loading.tscn")

func _on_backbutton_pressed():
	get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")





#TODO change to different game 
func _on_level_2_pressed():
	print(Globalscript.new_high_score)
