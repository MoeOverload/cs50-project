extends Control




func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://ui scenes/settings_menu.tscn")


func _on_hardbutton_pressed():
	Globalscript.easy_mode = false
	Globalscript.med_mode = false
	Globalscript.hard_mode = true
	get_tree().change_scene_to_file("res://ui scenes/level_select.tscn")


func _on_medbutton_pressed():
	Globalscript.easy_mode = false
	Globalscript.hard_mode = false
	Globalscript.med_mode = true
	get_tree().change_scene_to_file("res://ui scenes/level_select.tscn")


func _on_easybutton_pressed():
	Globalscript.med_mode = false
	Globalscript.hard_mode = false
	Globalscript.easy_mode = true
	get_tree().change_scene_to_file("res://ui scenes/level_select.tscn")

