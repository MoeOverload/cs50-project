extends Control
@onready var gameOne = $"."
	
func _on_load_timer_timeout():
	
	get_tree().change_scene_to_file("res://ui scenes/loadingscreen/loading_screen_2.tscn")
