extends PanelContainer
@onready var gameOne = $"."

func _process(_delta):
	if Globalscript.is_game_over == true:
		
		self.visible = true
		if Input.is_action_just_pressed("quitToMenu"):
			if Globalscript.score > Globalscript.new_high_score:
				Globalscript.new_high_score = Globalscript.score
			if Globalscript.rounds_counter > Globalscript.highest_round:
				Globalscript.highest_round = Globalscript.rounds_counter
			if Globalscript.kill_store > Globalscript.most_kills:
				Globalscript.most_kills = Globalscript.kill_store
			Globalscript.save_game()
			Globalscript.score = 0
			Globalscript.rounds_counter = 1
			Globalscript.kill_counter = 0 
			
			self.visible = false
			get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")
			gameOne.queue_free()
		elif Input.is_action_just_pressed("enter"):
			if Globalscript.score > Globalscript.new_high_score:
				Globalscript.new_high_score = Globalscript.score
			if Globalscript.rounds_counter > Globalscript.highest_round:
				Globalscript.highest_round = Globalscript.rounds_counter
			if Globalscript.kill_store > Globalscript.most_kills:
				Globalscript.most_kills = Globalscript.kill_store
			Globalscript.save_game()
			Globalscript.score = 0
			Globalscript.rounds_counter = 1
			Globalscript.kill_counter = 0 
			self.visible = false
			get_tree().change_scene_to_file("res://ui scenes/loadingscreen/loading.tscn")
			
			
