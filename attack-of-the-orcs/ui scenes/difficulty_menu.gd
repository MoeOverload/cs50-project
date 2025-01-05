extends Control




func _on_back_button_pressed():
	$back_sound.playing = true
	get_tree().change_scene_to_file("res://ui scenes/settings_menu.tscn")


func _on_hardbutton_pressed():
	$enter_sound.playing = true
	Globalscript.easy_mode = false
	Globalscript.med_mode = false
	Globalscript.hard_mode = true
	


func _on_medbutton_pressed():
	$enter_sound.playing = true
	Globalscript.easy_mode = false
	Globalscript.hard_mode = false
	Globalscript.med_mode = true
	

func _on_easybutton_pressed():
	$enter_sound.playing = true
	Globalscript.med_mode = false
	Globalscript.hard_mode = false
	Globalscript.easy_mode = true
	
