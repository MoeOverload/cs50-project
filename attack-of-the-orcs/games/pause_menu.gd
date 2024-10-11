extends PanelContainer



func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		
		self.visible = true
	


func _on_resume_pressed():
	self.visible = false


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")
