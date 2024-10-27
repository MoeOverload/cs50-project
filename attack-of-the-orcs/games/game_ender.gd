extends Node

var enemy = null
var boosts = null

func _on_area_2d_body_entered(body:Node2D):
	
	if body.is_in_group("enemy"):
		enemy = body
		enemy.queue_free()
		Globalscript.is_game_over = true

func _on_area_2d_area_entered(area:Area2D):
	if area.is_in_group("boosts"):
		boosts = area 
		boosts.queue_free()
