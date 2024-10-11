extends Node2D

@export var enemy_tscn: PackedScene


func _process(_delta):
	if Globalscript.round_change == true:
		$Timer.paused = true
	else:
		$Timer.paused = false 
	
#time between spawns
func _on_timer_timeout():
	spawn_enemy()
	

func spawn_enemy():
	#declare a new enemy, referencing the enemy scene
	var new_enemy = enemy_tscn.instantiate()
	#add enemy as a child of spawner
	self.add_child(new_enemy)
	
	#declare where the enemies will spawn
	#find height of viewport
	
	#spawn at random points in set viewport params
	var rand_y = randf_range(15, 205)

	new_enemy.position.y = rand_y
	new_enemy.position.x= 400
	Globalscript.current_enemy_number += 1
