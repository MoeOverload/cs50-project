
extends PanelContainer

@onready var gameOne = $"."

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		
		
		self.visible = true
		gameOne.get_tree().paused = true

func _on_quit_pressed():
	if Globalscript.score > Globalscript.new_high_score:
		Globalscript.new_high_score = Globalscript.score
	if Globalscript.rounds_counter > Globalscript.highest_round:
		Globalscript.highest_round = Globalscript.rounds_counter
	if Globalscript.kill_store > Globalscript.most_kills:
		Globalscript.most_kills = Globalscript.kill_store
	Globalscript.score = 0
	Globalscript.rounds_counter = 1
	Globalscript.kill_counter = 0 
	Globalscript.total_enemy_number = 0
	gameOne.get_tree().paused = false
	Globalscript.save_game()
	gameOne.queue_free()
	get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")
	
	
	


func _on_resume_button_up():
	gameOne.get_tree().paused = false
	self.visible = false
