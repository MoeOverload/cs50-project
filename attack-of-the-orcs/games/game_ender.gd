extends Node

var enemy = null

func _on_area_2d_area_entered(area:Area2D):
	if area.is_in_group("enemy"):
		enemy = area
		enemy.queue_free()
		Globalscript.is_game_over = true




