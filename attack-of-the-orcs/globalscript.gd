extends Node
#scores
var score = 0
var new_high_score = 0
#is game over?
var is_game_over = false
var game_is_over = false
#round counters
var round_change = false
var rounds_counter = 1
var highest_round = 0
var round_enemy_cap = 10
#enemy variables
var is_attacking = false
var enemy_health
var enemy_speed 
var arrow_damage 
var current_enemy_number = 0
var total_enemy_number = 0
var kill_counter = 0
var kill_store = 0
var most_kills = 0
var is_dead = false
#player variables
var move_speed = 100
var is_criming = false
var crime_cooldown = false
#boost variables
var spawn_number 
var speed_boosted = false 
var rapid_fire_boosted = false
var raining_arrows = false
var health_boosted = false
var war_crimed = false
#difficulty varaiables
var easy_mode = false
var med_mode = false
var hard_mode = false 

func _process(_delta):
	
	set_difficulty()

func set_difficulty():
	if easy_mode == true:
		print("easy")
		enemy_speed = 30
		enemy_health = 40
		arrow_damage = 30 
		spawn_number = randi_range(0, 60)
	elif hard_mode == true:
		print("hard_mode")
		enemy_speed = 50
		enemy_health = 60 
		arrow_damage = 20
		spawn_number = randi_range(0,100)	
	elif med_mode == true:
		print("med")
		enemy_speed = 40
		enemy_health = 50
		arrow_damage = 25 
		spawn_number = randi_range(0,80)
	else:
		enemy_speed = 40
		enemy_health = 50
		arrow_damage = 25 
		spawn_number = randi_range(0,80)


func save_game():
	var file = FileAccess.open("user://savegame.data", FileAccess.WRITE)
	var saved_data = {}
	saved_data["HighScore"] = new_high_score
	saved_data["HighestRound"] = highest_round
	saved_data["HighestKills"] = most_kills
	file.store_var(saved_data)
	file.close()

	
	



func load_game():
	var file = FileAccess.open("user://savegame.data", FileAccess.READ)
	var saved_data = file.get_var()
	new_high_score = saved_data["HighScore"]
	highest_round  = saved_data["HighestRound"]
	most_kills = saved_data["HighestKills"]
	file.close()
