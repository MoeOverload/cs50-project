extends Node

var raining_arrow = null

func _on_area_2d_area_entered(area:Area2D):
	if area.is_in_group("rainingarrow"):
		raining_arrow = area
		raining_arrow.queue_free()
