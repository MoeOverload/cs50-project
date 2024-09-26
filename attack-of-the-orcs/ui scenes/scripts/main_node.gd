extends Node

#first node (TITLE SCREEN) 
func _process(_delta):	
	#if the user presses enter switch scene to main menu
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")
		