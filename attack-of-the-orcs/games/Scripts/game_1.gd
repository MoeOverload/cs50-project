extends Node2D

#####TODO####
#create an initial number of orcs to count up to
#UPDATE variables for enemy health and damage output
#increment the amount of enemys that spawn 
#RESET the barrier health on round end 

func _process(_delta):
	
	if Globalscript.current_enemy_number == Globalscript.round_enemy_cap:
		print ("round switch!")
		Globalscript.round_change = true
		round_reset()
		Globalscript.round_change = false
	print(Globalscript.current_enemy_number)

func round_reset():
	Globalscript.round_enemy_cap += 10
	Globalscript.enemy_health +=10
	Globalscript.enemy_speed += 10 
	Globalscript.barrier_health += 10
	Globalscript.rounds_counter += 1
	Globalscript.highest_round += 1
	Globalscript.current_enemy_number = 0


