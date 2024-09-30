extends PanelContainer





func _process(_delta):
	if Globalscript.is_game_over == true:
		self.visible = true
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")
			Globalscript.new_high_score = Globalscript.score
			Globalscript.score = 0
			Globalscript.is_game_over = false
			self.visible = false
		elif Input.is_action_just_pressed("tryagain"):
			Globalscript.score = 0
			get_tree().reload_current_scene()
			Globalscript.is_game_over = false
			self.visible = false
			print("restart")



