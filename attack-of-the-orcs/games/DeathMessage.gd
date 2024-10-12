extends PanelContainer


func _process(_delta):
	if Globalscript.is_game_over == true:
		self.visible = true
		if Input.is_action_just_pressed("quitToMenu"):
			get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")
			Globalscript.new_high_score = Globalscript.score
			Globalscript.highest_round = Globalscript.rounds_counter
			Globalscript.most_kills = Globalscript.kill_store
			Globalscript.score = 0
			Globalscript.rounds_counter = 1
			Globalscript.kill_counter = 0 
			Globalscript.is_game_over = false
			self.visible = false
		elif Input.is_action_just_pressed("enter"):
			Globalscript.score = 0
			Globalscript.rounds_counter = 1
			Globalscript.kill_counter = 0

			get_tree().reload_current_scene()
			Globalscript.is_game_over = false
			self.visible = false
			