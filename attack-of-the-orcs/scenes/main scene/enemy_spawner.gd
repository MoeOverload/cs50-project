extends Node2D


@export var enemy_tscn : PackedScene



func _on_timer_timeout():
    var new_enemy = enemy_tscn.instantiate()
    self.add_child(new_enemy)
    
    var viewport_width = get_viewport_rect().size.y
    var rand_y = randf_range(0, viewport_width)
    
    new_enemy.position.y = rand_y
    new_enemy.position.x = 450
