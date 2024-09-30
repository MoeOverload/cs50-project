extends Control




func _process(_delta):
	$Timer.start()
	
func _on_timer_timeout():
	
	get_tree().change_scene_to_file("res://games/game1.tscn")