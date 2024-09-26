extends Node2D

@export var enemy_tscn: PackedScene

#time between spawns
func _on_timer_timeout():
	#declare a new enemy, referencing the enemy scene
	var new_enemy = enemy_tscn.instantiate()
	#add enemy as a child of spawner
	self.add_child(new_enemy)
	#declare where the enemies will spawn
	#find height of viewport
	var viewport_width = get_viewport_rect().size.y
	#spawn at random points in set viewport params
	var rand_y = randf_range(0, viewport_width)

	new_enemy.position.y = rand_y
	new_enemy.position.x= 400
