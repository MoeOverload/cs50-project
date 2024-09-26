extends Control



func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://games/game1.tscn")

func _on_backbutton_pressed():
	get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")




