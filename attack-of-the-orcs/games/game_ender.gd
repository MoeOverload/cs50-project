extends Node

var enemy = null


func _on_area_2d_body_entered(body:Node2D):
	
	if body.is_in_group("enemy"):
		enemy = body
		Globalscript.is_game_over = true
		enemy.queue_free()
	else:
		enemy=null
		Globalscript.is_game_over = false
