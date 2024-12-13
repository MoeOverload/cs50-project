extends Control

func _on_load_timer_timeout():
	Globalscript.game_is_over = false	
	get_tree().change_scene_to_file("res://games/game1.tscn")
