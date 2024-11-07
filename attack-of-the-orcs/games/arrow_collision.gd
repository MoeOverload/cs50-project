extends Node


var arrow = null

func _on_area_2d_area_entered(area:Area2D):
	if area.is_in_group("arrow"):
		arrow = area
		arrow.queue_free()
		