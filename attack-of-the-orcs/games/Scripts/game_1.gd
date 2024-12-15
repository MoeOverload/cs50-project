extends Node2D

	
	
func _process(_delta):
	
	
	if Globalscript.total_enemy_number == Globalscript.round_enemy_cap:
		Globalscript.round_change = true
	if Globalscript.kill_counter == Globalscript.round_enemy_cap:
		round_reset()
		Globalscript.save_game()
		Globalscript.round_change = false
	
	

func round_reset():
	Globalscript.kill_store += Globalscript.kill_counter
	Globalscript.round_enemy_cap += 5
	Globalscript.enemy_health += 2
	Globalscript.enemy_speed += 1 
	Globalscript.rounds_counter += 1
	Globalscript.current_enemy_number = 0
	Globalscript.total_enemy_number = 0
	Globalscript.kill_counter = 0
	
