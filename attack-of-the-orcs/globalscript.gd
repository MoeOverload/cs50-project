extends Node
#scores
var score = 0
var new_high_score = 0
#is game over?
var is_game_over = false
#round counters
var rounds_counter = 1
var highest_round = 0
#enemy variables
var enemy_health = 50
var enemy_speed = 75
var arrow_damage = 25
var current_enemy_number = 0
var kill_counter = 0
var kill_store = 0
var most_kills = 0
var round_enemy_cap = 10
#barrier varaibles
var barrier_health = 100
#player variables
var move_speed = 600



	
var round_change = false