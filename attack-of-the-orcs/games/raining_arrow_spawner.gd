extends Node2D

@export var rainingArrow_tscn: PackedScene



func _process(_delta):
	if Globalscript.raining_arrows == true:
		$arrowTimer.paused = false
	else:
		$arrowTimer.paused = true



func _on_timer_timeout():
	spawn_arrow()


func spawn_arrow():
	var new_arrow = rainingArrow_tscn.instantiate()
	self.add_child(new_arrow)
	var rand_x = randf_range(100,425)
	new_arrow.position.x = rand_x
	new_arrow.position.y = -5
