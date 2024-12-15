extends PanelContainer
@onready var gameOne = $"."
func _physics_process(_delta):
	if Globalscript.is_game_over == true:
		self.visible = true
	
			
func _on_menu_option_button_up() -> void:
	if Globalscript.score > Globalscript.new_high_score:
		Globalscript.new_high_score = Globalscript.score
	if Globalscript.rounds_counter > Globalscript.highest_round:
		Globalscript.highest_round = Globalscript.rounds_counter
	if Globalscript.kill_store > Globalscript.most_kills:
		Globalscript.most_kills = Globalscript.kill_store
	Globalscript.Game_reset()
	gameOne.queue_free()
	get_tree().change_scene_to_file("res://ui scenes/main_menu.tscn")
